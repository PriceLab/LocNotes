# LocNotes
informal annotation of chromosomal locations

Sample use (from the unitTests)

````
  notes <- LocNotes("chr1", 10, 100)
  checkEquals(getLocationString(notes), "chr1:10-100")
  checkEquals(getChromosome(notes), "chr1")
  checkEquals(getStart(notes), 10)
  checkEquals(getEnd(notes), 100)

  addNote(notes, "foo", "bar")
  addNote(notes, "count", 16);
  addNote(notes, "pval", 1.2e3)

  checkEquals(sort(getNames(notes)), c("count", "foo", "pval"))
  checkEquals(getNote(notes, "count"), 16)
  checkEquals(getNote(notes, "foo"), "bar")
  checkEquals(getNote(notes, "pval"), 1.2e3)
  ````
  One might use this by:
  
  * creating a notes object associated with a research project
  * saving your accumulating notes at the end of each session, e.g. `save(notes, file="~/ADnotes.RData")`
  
