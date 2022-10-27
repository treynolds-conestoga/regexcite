
<!-- README.md is generated from README.Rmd. Please edit that file -->

**NOTE: This is a toy package created for expository purposes, for the
second edition of [R Packages](https://r-pkgs.org). It is not meant to
actually be useful. If you want a package for factor handling, please
see [stringr](https://stringr.tidyverse.org),
[stringi](https://stringi.gagolewski.com/),
[rex](https://cran.r-project.org/package=rex), and
[rematch2](https://cran.r-project.org/package=rematch2).**

# regexcite

<!-- badges: start -->
<!-- badges: end -->

The goal of regexcite is to make regular expressions more exciting! It
provides convenience functions to make some common tasks with string
manipulation and regular expressions a bit easier.

## Installation

You can install the development version of regexcite from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("treynolds-conestoga/regexcite")
#> Downloading GitHub repo treynolds-conestoga/regexcite@HEAD
#> stringr (1.4.0 -> 1.4.1) [CRAN]
#> Installing 1 packages: stringr
#> Installing package into 'C:/Users/treynolds/AppData/Local/Temp/RtmpuodixO/temp_libpath2a7451245d67'
#> (as 'lib' is unspecified)
#> package 'stringr' successfully unpacked and MD5 sums checked
#> 
#> The downloaded binary packages are in
#>  C:\Users\treynolds\AppData\Local\Temp\RtmpYlgy3W\downloaded_packages
#>          checking for file 'C:\Users\treynolds\AppData\Local\Temp\RtmpYlgy3W\remotes4524724e31e5\treynolds-conestoga-regexcite-dfe0765/DESCRIPTION' ...     checking for file 'C:\Users\treynolds\AppData\Local\Temp\RtmpYlgy3W\remotes4524724e31e5\treynolds-conestoga-regexcite-dfe0765/DESCRIPTION' ...   ✔  checking for file 'C:\Users\treynolds\AppData\Local\Temp\RtmpYlgy3W\remotes4524724e31e5\treynolds-conestoga-regexcite-dfe0765/DESCRIPTION' (702ms)
#>       ─  preparing 'regexcite':
#>    checking DESCRIPTION meta-information ...     checking DESCRIPTION meta-information ...   ✔  checking DESCRIPTION meta-information
#>       ─  checking for LF line-endings in source and make files and shell scripts
#>   ─  checking for empty or unneeded directories
#>       ─  building 'regexcite_0.0.0.9000.tar.gz'
#>      
#> 
#> Installing package into 'C:/Users/treynolds/AppData/Local/Temp/RtmpuodixO/temp_libpath2a7451245d67'
#> (as 'lib' is unspecified)
```

## Usage

A fairly common task when dealing with strings is the need to split a
single string into many parts. This is what `base::strplit()` and
`stringr::str_split()` do.

``` r
(x <- "alfa,bravo,charlie,delta")
#> [1] "alfa,bravo,charlie,delta"
strsplit(x, split = ",")
#> [[1]]
#> [1] "alfa"    "bravo"   "charlie" "delta"
stringr::str_split(x, pattern = ",")
#> [[1]]
#> [1] "alfa"    "bravo"   "charlie" "delta"
```

Notice how the return value is a **list** of length one, where the first
element holds the character vector of parts. Often the shape of this
output is inconvenient, i.e. we want the un-listed version.

That’s exactly what `regexcite::str_split_one()` does.

``` r
library(regexcite)

str_split_one(x, pattern = ",")
#> [1] "alfa"    "bravo"   "charlie" "delta"
```

Use `str_split_one()` when the input is known to be a single string. For
safety, it will error if its input has length greater than one.

`str_split_one()` is built on `stringr::str_split()`, so you can use its
`n` argument and stringr’s general interface for describing the
`pattern` to be matched.

``` r
str_split_one(x, pattern = ",", n = 2)
#> [1] "alfa"                "bravo,charlie,delta"

y <- "192.168.0.1"
str_split_one(y, pattern = stringr::fixed("."))
#> [1] "192" "168" "0"   "1"
```
