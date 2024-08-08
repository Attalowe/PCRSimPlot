#' Simulate PCR Data
#'
#' This function simulates PCR fluorescence data based on initial DNA amount,
#' efficiency, and a threshold value.
#'
#' @param N0 Initial amount of DNA.
#' @param E Efficiency of the PCR process.
#' @param threshold Threshold value for detecting the cycle.
#'
#' @return A list with two elements: pcr_data (a data frame) and Ct (the cycle threshold).
#' @export
simulate_pcr <- function(N0, E, threshold = 10000) {
  # Create a vector to store fluorescence and dna values for cycles 0 to 40
  cycles <- 40
  dna <- numeric(cycles)
  fluorescence <- numeric(cycles)
  a <- stats::rnorm(n=1, mean = 1000, sd = 3) # Random intercept value for fluorescence, drawn from a normal distribution.
  b <- stats::runif(1,1,5) # Random slope value for fluorescence, drawn from a uniform distribution between 1 and 5.

  # Initial fluorescence value at cycle 0
  dna[1] <- N0
  fluorescence[1] <- a + b*dna[1]

  # Simulate fluorescence for each cycle
  for (t in 2:(cycles)) {
    dna[t] <- N0*E^t
    fluorescence[t] <- a + b*dna[t]
  }

  pcr_data <- data.frame(
    Cycle = 1:cycles,
    DNA = dna,
    Fluorescence = fluorescence
  )

  # Find the cycle threshold (Ct)
  Ct <- which(fluorescence >= threshold)[1] - 1

  return(list(pcr_data = pcr_data, Ct = Ct))
}
