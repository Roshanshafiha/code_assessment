# Question 3 answers 

Question 3.1:
How many genes in the gene table have an id_biotype of 23?
Answer:
SELECT COUNT (ID_BIOTYPE)
FROM gene
WHERE ID_BIOTYPE=23

Question 3.2:
What is the Ensembl Gene ID for the Gene_symbol TTTY2?
Answer:
SELECT ENSEMBL_GENE_ID
FROM gene
WHERE GENE_SYMBOL=’TTY2’

Question 3.3:
Give a breakdown of the number of genes for each chromosome.
Answer:
SELECT CHROMOSOME , COUNT (ID_GENE) AS Gene_count
FROM gene
GROUP BY CHROMOSOME 
ORDER BY CHROMOSOME 

Question 3.4:
How many Transcripts does the Gene Symbol RAI14 has?
Answer:
SELECT ID_GENE , COUNT (ID_GENE) AS transcript_count
FROM transcript
WHERE ID_GENE= (SELECT GENE_ID FROM gene WHERE GENE_SYMBOL=’RAI14’)

Question 3.5:
What is the canonical transcript accession for Ensembl Gene id ENSG00000266960?
Answer:
SELECT ID_GENE,IS_CANNONICAL,ACCESSION
FROM transcript
WHERE ID_GENE = (SELECT ID_GENE FROM gene WHERE ENSEMBL_GENE_ID=’ ENSG00000266960’)

Question 3.6:
List the Transcript accessions for the Gene Symbol AK1 with id_biotype 23 and flags
gencode_basic
Answer:
SELECT ID_GENE,FLAGS,ACCESSION
FROM transcript
WHERE ID_GENE = (SELECT ID_GENE FROM gene WHERE GENE_SYMBOL=’ AK1’ AND ID_BIOTYPE=23)
AND FLAGS = ‘genecode_basic’

Question 3.7:
Imagine that we have a table called “some_gene” with only a subset of the gene data. If I
want to join the gene table with this table but display all the genes in the result, what kind of
join would you do?
Answer:
SELECT ID_GENE , GENE_SYMBOL
FROM gene 
LEFT JOIN some_gene ON gene.ID_GENE = some_gene.ID_GENE

Question 3.8:
Imagine that the gene and transcript tables are getting very big and that joining the two tables
get slower and slower. What would you do to improve performances?
Answer:
-	Create an index on the GENE_ID column to join the table in a much faster rate.
-	Denormalization of data can be performed keeping in mind that this approach has faster read and slower write operation on the data.

Question 3.9:
If you want to avoid duplicates in a table, what kind of index would you create?
Answer:
-	To start with , make a new table with the same structure as the table with duplicates.
-	Put a unique index on the table that was created above.
-	Run an insert query to transfer your dublicated table into your new table. Any duplicates will get kicked out into a "Paste Errors" table and your new table will not have duplicates.


Question 3.10:
If you want to make sure that all the id_gene ids in the transcript table exists in the gene table,
what kind of index would you create?
Answer:

CREATE INDEX idx_gene_id_gene ON gene(ID_GENE);
CREATE INDEX idx_transcript_id_gene ON transcript(ID_GENE);

SELECT t.ID_GENE
FROM transcript t
LEFT JOIN gene g ON t.ID_GENE = g.ID_GENE
WHERE g.ID_GENE IS NULL;

The last lines of code check if the ID_GENE present in the transcript is in the gene table too otherwise it creates a null.