
#' @import processx
volreg <- function(...) {
  gen_afni_command("3dvolreg", list(...))
}


#' @export
blur <- function(input, fwhm=5, prefix=NULL, mask=NULL, doall=NULL) {
  opts <- list("1blur_fwhm"=fwhm, prefix=prefix, mask=mask, doall=doall)
  gen_afni_command("3dmerge", opts, input)
}


#' @export
timestat <- function(input, ...) {
  gen_afni_command("3dvolreg", list(...), input=input)
}

#' @export
to3d <- function(prefix, ...) {
  gen_afni_command("to3d", list(...), prefix=prefix)
}

#' @export
dimon <- function(...) {
  gen_afni_command("Dimon", list(...))
}

#' @export
run_dimon <- function(infile_pattern, prefix, nslices=NULL, sp=c("FROM_IMAGE", "alt+z", "alt+z2", "alt-z", "alt-z2", "seq-z", "seq+z", "zero")) {
  sp <- match.arg(sp)
  cmd <- dimon(infile_pattern=paste("'", infile_pattern, "'"), dicom_org=TRUE, GERT_Reco=TRUE,
        gert_to3d_prefix=prefix, gert_nz=nslices, sp=sp, quit=TRUE, gert_create_dataset=TRUE)



}


