# Fixing-column-headers
A short function in R which repairs Excel file imports where column headers are both spread over multiple rows and/or include merged cells.

`tidy_column_names(df, name_rows, first_data_row = NULL, sep = " ", drop_name_rows = TRUE)`

`df` must be a data frame

`name_rows` should be an integer vector (or coercable to one) which specifies the row numbers in which all column header information exists. These do not need to be presented in numerical order but instead in the order in which you want the contents of each row concatenated in a single column header.

`first_data_row` defaults to the row below the largest integer in `name_rows` but can be overridden.

`sep` defines what should separate each individual value in combined header texts.

`drop_name_rows` by default removes all rows named in `named_rows` and also all rows up to but not including `first_data_row`.
