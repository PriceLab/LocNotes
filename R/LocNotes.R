#------------------------------------------------------------------------------------------------------------------------
.LocNotes <- setClass ("LocNotes",
                       representation = representation(chromosome="character",
                                                       start="numeric",
                                                       end="numeric",
                                                       notes="environment")
                    )

#------------------------------------------------------------------------------------------------------------------------
printf <- function(...) print(noquote(sprintf(...)))
#------------------------------------------------------------------------------------------------------------------------
setGeneric("addNote",                  signature="obj", function(obj, name, value) standardGeneric ("addNote"))
setGeneric("getLocationString",        signature="obj", function(obj) standardGeneric ("getLocationString"))
setGeneric("getNames",                 signature="obj", function(obj) standardGeneric ("getNames"))
setGeneric("getNote",                  signature="obj", function(obj, name) standardGeneric ("getNote"))
setGeneric("getChromosome",            signature="obj", function(obj, name) standardGeneric ("getChromosome"))
setGeneric("getStart",                 signature="obj", function(obj, name) standardGeneric ("getStart"))
setGeneric("getEnd",                   signature="obj", function(obj, name) standardGeneric ("getEnd"))

#------------------------------------------------------------------------------------------------------------------------
LocNotes <- function(chromosome, start, end)
{
  .LocNotes(chromosome=chromosome, start=start, end=end, notes=new.env(parent=emptyenv()))

} # LocNotes, the constructor
#------------------------------------------------------------------------------------------------------------------------
setMethod("addNote", "LocNotes",

  function (obj, name, value){
     obj@notes[[name]] <- value
     })

#------------------------------------------------------------------------------------------------------------------------
setMethod("getNames", "LocNotes",

  function (obj){
     sort(ls(obj@notes))
     })

#------------------------------------------------------------------------------------------------------------------------
setMethod("getNote", "LocNotes",

  function (obj, name){
     obj@notes[[name]]
     })

#------------------------------------------------------------------------------------------------------------------------
setMethod("getChromosome", "LocNotes",

  function (obj, name){
     obj@chromosome
     })

#------------------------------------------------------------------------------------------------------------------------
setMethod("getStart", "LocNotes",

  function (obj, name){
     obj@start
     })

#------------------------------------------------------------------------------------------------------------------------
setMethod("getEnd", "LocNotes",

  function (obj, name){
     obj@end
     })

#------------------------------------------------------------------------------------------------------------------------
setMethod("getLocationString", "LocNotes",

  function (obj){
     sprintf("%s:%d-%d", obj@chromosome, obj@start, obj@end)
     })

#------------------------------------------------------------------------------------------------------------------------
