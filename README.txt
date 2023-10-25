## My Project

This project aims to help NLP researchers to automatically organise and  annotate their collected texts (.txt).


### Installation
To install my project, simply download:
https://nlp.stanford.edu/software/stanford-corenlp-4.5.5.zip 

Add these two folders shared in Git into the StandfordCoreNLP folder
output 
input

In addition, you can add your own files that contain information and save as .txt in the input file.

Instructions:

1) First select the files for the analysis with the names of each file text:
Make sure the correct setwd: #e.g. ('/Users/joselema/desktop/StandfordCoreNLP/')
Check the folder "input". It includes .txt examples. As mentioned above here you can add your own texts.  
#create "file.txt" to put the file names that you plan to analyse.

2) Run the following command in "R Studio":
# Create the object `filelist`.
files <- dir('input/')
filelist <- paste('input/', files, sep = '', collapse = '\n')

# Write the object `filelist` to the file `filelist.txt`.
cat(filelist, file = 'filelist.txt')

3) In the folder check the outcomes "files.txt"
#In the example provided there are 10 files: "input/A10T2L3TTEEssayForum2FSGrade8.txt"

4) For Windows Windows PowerShell ISE or Mac Terminal  instruct the computer to apply the annotator, enter the command :
 java -cp "*" -Xmx2g edu.stanford.nlp.pipeline.StanfordCoreNLP -anno- tators tokenize, ssplit, pos, lemma, ner, parse, dcoref -parse.flags " -make- CopulaHead" -filelist filelist.txt -outputFormat conll -outputDirectory output

5) Check the "output" folder. The outcome files .txt.conll. can be read with any text editor. 

Troubleshooting tips

- Make sure you have installed Java 8. 

- If outofmemory error, try:

java -cp "*" -Xms3056m  edu.stanford.nlp.pipeline.StanfordCoreNLP -anno- tators tokenize, ssplit, pos, lemma, ner, parse, dcoref -parse.flags " -make- CopulaHead" -filelist filelist.txt -outputFormat conll -outputDirectory output 


Links to additional documentation or resources

https://stanfordnlp.github.io/stanfordnlp/
https://www.routledge.com/Corpus-Linguistics-for-Writing-Development-A-Guide-for-Research/Durrant
  
