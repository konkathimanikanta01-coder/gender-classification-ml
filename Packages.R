# Required Packages for Gender Classification Project
# Run this script once to install all necessary packages

# List of required packages
packages <- c(
  "tidyverse",      # Data manipulation and visualization
  "caret",          # Machine learning framework
  "randomForest",   # Random Forest algorithm
  "ROCR",           # ROC curves and AUC
  "GGally",         # Correlation matrices
  "e1071",          # Naive Bayes classifier
  "reshape2",       # Data reshaping for heatmaps
  "rmarkdown",      # R Markdown rendering
  "knitr"           # R Markdown knitting
)

# Function to install packages if not already installed
install_if_missing <- function(package) {
  if (!require(package, character.only = TRUE, quietly = TRUE)) {
    cat(paste("Installing", package, "...\n"))
    install.packages(package, dependencies = TRUE)
  } else {
    cat(paste("✓", package, "is already installed.\n"))
  }
}

# Install all packages
cat("================================================\n")
cat("Gender Classification Project - Package Setup\n")
cat("================================================\n\n")
cat("Checking and installing required packages...\n\n")

sapply(packages, install_if_missing)

cat("\n================================================\n")
cat("✓ All required packages are installed!\n")
cat("================================================\n\n")

cat("You can now run the analysis:\n")
cat("  1. Open PART_II_DM.Rmd in RStudio\n")
cat("  2. Click 'Knit' or run chunks sequentially\n\n")

# Optional: Load all packages to verify installation
cat("Verifying package installation...\n")
success <- sapply(packages, function(pkg) {
  require(pkg, character.only = TRUE, quietly = TRUE)
})

if (all(success)) {
  cat("\n✓ All packages loaded successfully!\n\n")
  cat("System Information:\n")
  cat("  R Version:", R.version.string, "\n")
  cat("  Platform: ", R.version$platform, "\n")
  cat("\n")
  cat("Ready to analyze! 🎉\n")
} else {
  failed <- packages[!success]
  cat("\n✗ The following packages failed to load:\n")
  print(failed)
  cat("\nPlease try installing them manually:\n")
  cat("  install.packages(c('", paste(failed, collapse = "', '"), "'))\n", sep = "")
}