tidy_column_names <- function(df, name_rows, first_data_row) {
  if (is.vector(name_rows) & is.numeric(name_rows) & is.data.frame(df)) {
    l <- length(name_rows)
    r <- df[name_rows[1]:name_rows[l],]
    r <- as.data.frame(t(r))
    r <- tidyr::fill(r, dplyr::everything())
    r <- as.data.frame(t(r))
    # this shouldn't overwrite previous values:
    n <- ""
    for (i in seq_along(1:nrow(r))) {
      n <- paste(n, r[i,])
    }
    # n <- paste(r[1,], r[2,], r[3,])
    n <- stringr::str_remove_all(n, "NA") %>%
      stringr::str_replace_all("([A-Za-z])\\d\\b", "\\1") %>%
      stringr::str_squish()
    df <- df[-(name_rows[1]:name_rows[l]), ]
    if (!is.null(first_data_row)) {
      df <- df[-(1:first_data_row), ]
    }
    names(df) <- n
    warning("Column indices ", toString(stringr::str_which(n, "^$")), " have no names.")
    return(df)
  }
}
