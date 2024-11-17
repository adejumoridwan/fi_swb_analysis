library(forestplot)
cancer <- read.csv("https://raw.githubusercontent.com/adejumoridwan/datasets/refs/heads/main/cancer_data")

cancer |> 
  forestplot(
    mean = cancer$EffectSize,
    lower = cancer$CI_lower,
    upper = cancer$CI_upper,
    labeltext = c(Study, EffectSize, CI_lower, CI_upper),
    xlog = TRUE,
    boxsize = 0.25,
    vertices = TRUE,) |> 
  fp_add_header(Study = c("Study"),
                EffectSize = c("Effect Size"),
                CI_lower  = c("Lower CI"),
                CI_upper = c("Upper CI")) |>
  fp_append_row(mean  = mean(cancer$EffectSize),
                lower = mean(cancer$CI_lower),
                upper = mean(cancer$CI_upper),
                Study = "Summary",
                EffectSize = mean(cancer$EffectSize),
                is.summary = TRUE) |>
  fp_add_lines() |> 
  fp_set_style(box = "royalblue",
               line = "darkblue",
               summary = "royalblue") |>
  fp_set_zebra_style("#EFEFEF")
