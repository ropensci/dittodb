# grab available platforms
plat <- as.data.frame(rhub::platforms())
cran_plat <- plat[!is.na(plat$`cran-name`), ]
rhub_plat <- cran_plat[!grepl("debian|fedora", cran_plat$name), ]


rhub::check_for_cran(platforms = rhub_plat$name)
rhub::check_for_cran(platforms = "windows-x86_64-devel", env_vars = c(R_COMPILE_AND_INSTALL_PACKAGES = "always"))
### Flavors for CRAN checks
# "macos-highsierra-release-cran"
# https://builder.r-hub.io/status/dittodb_0.1.0.tar.gz-3ce1774bd743458f90ff902a6676a2bb
# spell check error?

rhub::check_for_cran(platforms = "solaris-x86-patched")

# "solaris-x86-patched"
# https://builder.r-hub.io/status/dittodb_0.1.0.tar.gz-67d1384703f144dea2cda0bfd4788c1d
# 1 WARNING, 3 NOTEs
# WARNING: ‘qpdf’ is needed for checks on size reduction of PDFs
# NOTE: Files ‘README.md’ or ‘NEWS.md’ cannot be checked without ‘pandoc’ being installed.
# NOTE: Maintainer New submission
# NOTE: Compilation used the following non-portable flag(s): ‘-march=pentiumpro’

# "solaris-x86-patched-ods"
# https://builder.r-hub.io/status/dittodb_0.1.0.tar.gz-ef67183709794335be665d51a64f3615
# 1 WARNING, 2 NOTEs
# WARNING: ‘qpdf’ is needed for checks on size reduction of PDFs
# NOTE: Files ‘README.md’ or ‘NEWS.md’ cannot be checked without ‘pandoc’ being installed.
# NOTE: Maintainer New submission

# "windows-x86_64-devel"
# https://builder.r-hub.io/status/dittodb_0.1.0.tar.gz-573f9fffda0748118878fe9f430952cd
# 2 ERRORs, 1 WARNING, 1 NOTE
# ERRORs: tibble version 3.0.2 issue
# WARNING: Error(s) in re-building vignettes
# NOTE: Maintainer New submission

# "windows-x86_64-oldrel"
# https://builder.r-hub.io/status/dittodb_0.1.0.tar.gz-1e7219f16cce44c0bc95d3384422f090
# NOTE: Maintainer New submission

# "windows-x86_64-release"
# https://builder.r-hub.io/status/dittodb_0.1.0.tar.gz-bafc053c9a7f4f808dc90fceca3613a6
# NOTE: Maintainer New submission



# local checks because sysreqs is not up to date. Running a modified version of
# sysreqs.app and sysreqs to look locally to detect differences
# These are bash commands to run in a terminal (in parallel, ideally)
# "debian-gcc-release"
SYSREQS_URL=sysreqs-jk.herokuapp.com Rscript -e 'rhub::local_check_linux(image = "rhub/debian-gcc-release",  check_args = "--as-cran")'
# NOTE: Maintainer New submission

# terminal 1
# "fedora-clang-devel"
SYSREQS_URL=sysreqs-jk.herokuapp.com Rscript -e 'rhub::local_check_linux(image = "rhub/fedora-clang-devel", check_args = "--as-cran")'
# NOTE: Maintainer New submission

# terminal 2
# "fedora-gcc-devel"
SYSREQS_URL=sysreqs-jk.herokuapp.com Rscript -e 'rhub::local_check_linux(image = "rhub/fedora-gcc-devel",  check_args = "--as-cran")'
# NOTE: Maintainer New submission

# terminal 3
# "debian-clang-devel"
SYSREQS_URL=sysreqs-jk.herokuapp.com Rscript -e 'rhub::local_check_linux(image = "rhub/debian-clang-devel",  check_args = "--as-cran")'
# NOTE: Maintainer New submission

# terminal 4
# "debian-gcc-devel"
SYSREQS_URL=sysreqs-jk.herokuapp.com Rscript -e 'rhub::local_check_linux(image = "rhub/debian-gcc-devel",  check_args = "--as-cran")'
# NOTE: Maintainer New submission

# terminal 5
# "debian-gcc-patched"
SYSREQS_URL=sysreqs-jk.herokuapp.com Rscript -e 'rhub::local_check_linux(image = "rhub/debian-gcc-patched",  check_args = "--as-cran")'
# NOTE: Maintainer New submission
