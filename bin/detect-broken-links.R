library(rvest)
library(purrr)
library(dplyr)

base_url <- Vectorize(function(url) {
  r <- httr::parse_url(url)
  r$path <- dirname(httr::parse_url(url)$path)
  httr::build_url(r)
}, USE.NAMES = FALSE)

get_page <- function(url, include_content = FALSE) {
  page <- list(status = 999, url = url)
  resp <- possibly(~httr::GET(.x), otherwise = NULL)(url)
  if (!is.null(resp)) {
    page$status <- httr::status_code(resp)
    page$url <- resp$url
    if (include_content) {
      page$content <- httr::content(resp, type = "text/html", encoding = "UTF-8")
    }
  }
  page
}

polite_GET_status <- function(urls, delay = .5) {
  statuses <- rep(0, length(urls))
  for (i in seq_along(urls)) {
    statuses[i] <- get_page(urls[i])$status
    Sys.sleep(delay)
  }
  statuses
}

check_page_links <- function(page, base = "", seen = data.frame(url = character(0)), delay = .5) {
  stopifnot(inherits(page, "xml_node"))
  stopifnot("url" %in% names(seen))
  page_ids <- page %>%
    html_nodes("*[id]") %>%
    html_attr("id") %>%
    paste0("#", .)
  page_hrefs <- page %>%
    html_nodes("a") %>%
    html_attr("href") %>%
    unique()
  grep_filter <- function(x, pattern, negate = FALSE, ...) x[grepl(pattern, x, ) != negate]
  links <- page_hrefs %>%
    grep_filter("^(#|mailto)", negate = TRUE) %>%
    tibble(href = .) %>%
    mutate(url = url_absolute(href, base = base))
  new_links <- links %>%
    anti_join(seen %>% select(-any_of("href")) %>% filter(!is.na(url)), by = "url") %>%
    mutate(
      status = polite_GET_status(url, delay = delay),
      result = case_when(status == 200 ~ "OK", status == 404 ~ "Not Found", TRUE ~ "Error")
    )
  seen_links <- links %>%
    inner_join(seen %>% select(-any_of("href")) %>% filter(!is.na(url)), by = "url")
  dups <- function(x) unique(x[duplicated(x)])
  dup_paged_ids <- dups(page_ids)
  anchors <- page_hrefs %>%
    grep_filter("^#") %>%
    tibble(href = .) %>%
    mutate(result = case_when(
      href %in% dup_paged_ids ~ "Duplicate ID",
      href %in% page_ids ~ "OK",
      TRUE ~ "Not Found"
    ))
  bind_rows(new_links, seen_links, anchors)
}

crawl_pages <- function(seed_url, root_url = base_url(seed_url), delay = .5) {
  resp <- get_page(seed_url, include_content = TRUE)
  page <- resp$content
  seed_url <- resp$url

  results <- check_page_links(page, base = seed_url, delay = delay) %>%
    mutate(page = seed_url)

  filter_children <- function(x, parent) {
    unique(x[which(startsWith(x, parent))])
  }
  scanned <- seed_url
  toscan <- setdiff(filter_children(results$url, root_url), scanned)
  seen <- results %>%
    select(url, status, result) %>%
    unique()
  while (length(toscan) > 0) {
    url <- toscan[1]
    toscan <- toscan[-1]
    resp <- get_page(url, include_content = TRUE)
    page <- resp$content
    if (!is.null(page)) {
      if (url != resp$url) {
        url <- resp$url
        if (url %in% c(toscan, scanned)) {
          toscan <- setdiff(toscan, url)
          next;
        }
      }

      pageresults <- check_page_links(page, base = url, seen = seen, delay = delay) %>%
        mutate(page = .env$url)

      candidates <- filter_children(pageresults %>% filter(status == 200) %>% pull(url), root_url)
      scanned <- c(scanned, url)
      toscan <- append(toscan, setdiff(setdiff(candidates, scanned), toscan))

      results <- results %>% bind_rows(pageresults)
      seen <- results %>%
        select(url, status, result) %>%
        unique()
    }
    Sys.sleep(delay)
  }
  results
}

detect_broken_links <- function(url, output_filename = "broken_links.tsv") {
  all_links <- crawl_pages(url)
  num_links <- nrow(all_links)
  broken_links <- all_links %>% filter(result != "OK")
  num_broken <- nrow(broken_links)
  if (num_broken == 0) {
    message(paste0(
      "✅ All links are OK! (n=",
      num_links,
      ")"
    ))
  } else {
    readr::write_tsv(broken_links, output_filename)
    stop(
      paste(
        "❗️ Detected",
        num_broken,
        "broken links out of",
        num_links,
        "total, see the file for details:",
        output_filename
      )
    )
  }
}
