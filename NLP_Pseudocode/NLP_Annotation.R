# Load necessary libraries
library(tidyverse)
library(tm)

# Get the list of files
Arch1 <- list.files("/Users/joselema/Desktop/NLP_Pseudocode/input/", pattern = "*.txt", full.names = TRUE)

# Initialize an empty list to store results
results <- list()

# Loop through each file
for (variable in Arch1) {
  
  # Read the input text file.
  text <- read_file(variable)
  
  # Clean the text.
  cleaned_text <- clean_text(text)
  
  # Tokenize the text.
  tokens <- unlist(strsplit(cleaned_text, "\\s+"))
  
  # Create a corpus.
  corpus <- Corpus(VectorSource(tokens))
  
  # Preprocess the corpus.
  corpus <- tm_map(corpus, content_transformer(tolower))
  corpus <- tm_map(corpus, removePunctuation)
  corpus <- tm_map(corpus, removeNumbers)
  corpus <- tm_map(corpus, removeWords, stopwords("en"))
  
  # Lemmatize the tokens.
  corpus <- tm_map(corpus, function(x) {
    unlist(stemDocument(x))
  })
  
  # Create a document-term matrix.
  dtm <- DocumentTermMatrix(corpus)
  
  # Convert dtm to a data frame.
  dtm_df <- as.data.frame(as.matrix(dtm))
  
  # Add column names (terms).
  colnames(dtm_df) <- Terms(dtm)
  
  # Save the result to a list with the filename
  results[[basename(variable)]] <- dtm_df
}

# Combine all results into one data frame
combined_results <- bind_rows(results, .id = "Filename")

# Save the combined results as one .csv
write.csv(combined_results, "Combined_Resultados_3.csv")
