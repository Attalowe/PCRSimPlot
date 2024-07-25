#' Plot PCR Data
#'
#' This function plots the PCR fluorescence data and the cycle threshold.
#'
#' @param pcr_data A data frame with PCR data (as output from `simulate_pcr`).
#' @param Ct The cycle threshold value (as output from `simulate_pcr`).
#'
#' @import ggplot2
#' @export
plot_pcr <- function(pcr_data, Ct){
  ggplot(pcr_data, aes(x = Cycle, y = Fluorescence)) +
    geom_line(color = "blue") +
    geom_vline(xintercept = Ct, linetype = "dashed", color = "red") + # Dashed line for Ct
    geom_hline(yintercept = 10000, linetype = "solid", color = "black") + # Solid line for the threshold
    labs(title = "PCR Simulation",
         subtitle = paste("Cycle Threshold (Ct) =", Ct),
         x = "Cycle",
         y = "Fluorescence") +
    theme_minimal()

}
