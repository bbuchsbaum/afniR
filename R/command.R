
#' @export
gen_afni_command <- function(program, opts, input=NULL) {
  argcmd <- map2(names(opts), opts, ~ paste(paste0("-", .x), paste(.y, collapse=" "))) %>% paste(collapse=" ")

  if (!is.null(input)) {
    argcmd <- paste(argcmd, paste(input, collapse=" "))
  }

  ret <- list(
    program=program,
    opts=opts,
    argcmd=argcmd
  )

  class(ret) <- c(program, "afni_command")
  ret

}


#' @export
run_command <- function (x, ...) { UseMethod("run_command", x) }


#' @export
run_command.afni_command <- function(x, ...) {
  processx::run(x$program, x$argcmd, ...)
}


