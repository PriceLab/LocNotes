library(RUnit)
library(LocNotes);
#------------------------------------------------------------------------------------------------------------------------
printf <- function(...) print(noquote(sprintf(...)))
#------------------------------------------------------------------------------------------------------------------------
runTests <- function()
{
   test_getLocationString()
   test_getLocation()
   test_addNotes()

} # runTests
#------------------------------------------------------------------------------------------------------------------------
test_getLocation <- function()
{
  printf("--- test_getLocation")

  notes <- LocNotes("chr1", 10, 100)
  checkEquals(getChromosome(notes), "chr1")
  checkEquals(getStart(notes), 10)
  checkEquals(getEnd(notes), 100)

} # test_getLocation
#------------------------------------------------------------------------------------------------------------------------
test_getLocationString <- function()
{
  printf("--- test_getLocationString")

  notes <- LocNotes("chr1", 10, 100)
  checkEquals(getLocationString(notes), "chr1:10-100")

} # test_getLocationString
#------------------------------------------------------------------------------------------------------------------------
test_addNotes <- function()
{
  printf("--- test_addNotes")

  notes <- LocNotes("chr1", 10, 100)
  addNote(notes, "foo", "bar")
  addNote(notes, "count", 16);
  addNote(notes, "pval", 1.2e3)

  checkEquals(sort(getNames(notes)), c("count", "foo", "pval"))
  checkEquals(getNote(notes, "count"), 16)
  checkEquals(getNote(notes, "foo"), "bar")
  checkEquals(getNote(notes, "pval"), 1.2e3)

} # test_addNotes
#------------------------------------------------------------------------------------------------------------------------
