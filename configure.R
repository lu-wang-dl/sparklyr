#!/usr/bin/env Rscript
library(sparklyr)
sparklyr:::livy_sources_refresh()

sparklyr:::spark_compile_embedded_sources()

targets <- c("2.4.0")

spec <- Filter(
  function(e) e$spark_version %in% targets,
  sparklyr::spark_default_compilation_spec()
)

sparklyr::compile_package_jars(spec = spec)
