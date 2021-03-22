
#getting MovieLense database
wget http://files.grouplens.org/datasets/movielens/ml-1m.zip
unzip ml-1m.zip

#Convert ratings.dat, trade “::” for “,”, and take only the first three columns:
cat ml-1m/ratings.dat | sed 's/::/,/g' | cut -f1-3 -d, > ratings.csv

#Put ratings file into HDFS:
hadoop fs -put ratings.csv /ratings.csv

#Run the recommender job:
mahout recommenditembased --input /ratings.csv --output recommendations --numRecommendations 10 --outputPathForSimilarityMatrix similarity-matrix --similarityClassname SIMILARITY_COSINE

#Look for the results in the part-files containing the recommendations:
hadoop fs -ls recommendations
hadoop fs -cat recommendations/part-r-00000 | head

