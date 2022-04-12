# Fixing-column-headers

## Description
The function `tidy_column_names()` repairs typically Microsoft Excel file imports where, in the raw data, column headers are spread over multiple rows and/or include merged cells.

## Usage
`tidy_column_names(df, name_rows, first_data_row = NULL, sep = " ", drop_name_rows = TRUE)`

## Arguments
`df` must be a data frame

`name_rows` should be an integer vector (or coercable to one) which specifies the row numbers in which all desired column header information exists. These do not need to be presented in numerical order but instead in the order in which you want the contents of each row concatenated in a single column header. Currently they must be contiguous but a future update will allow them to be non-contiguous.

`first_data_row` defaults to the row below the largest integer in `name_rows` but can be overridden.

`sep` defines what should separate each individual value in combined header texts.

`drop_name_rows` by default removes all rows named in `named_rows` and also all rows up to but not including `first_data_row`.

## Details
Values in merged cells are allocated to all cells to the right of the initial value where rows which include separate columns grouped under a merged cell are specified within `name_rows`. Empty cells are also filled rightwards with the value of the preceding (i.e. leftwards) non-empty cell in the same row. Any vlue within `name_rows` which contains a numerical digit at the end of word is assumed to be a footnote character and are removed.

## Value
Returns a `data frame`.
