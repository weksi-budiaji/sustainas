#' Social dimension data set
#'
#' A simulation dataset containing an component, i.e. social dimension.
#' It has eight variables of 12 locations measured for their scores/ indices.
#' The minimum score is 0, and the maximum is 10.
#'
#' @format A data frame with 12 rows and 8 variables:
#' \describe{
#'   \item{educ}{Education index.}
#'   \item{prosper}{Prosperity potential.}
#'   \item{care}{Social caring.}
#'   \item{suitable}{Index of suitability.}
#'   \item{otherAct}{Other activities.}
#'   \item{Wpoktan}{Group of farming.}
#'   \item{Wmanage}{Group management.}
#'   \item{conflict}{Potential of conflict.}
#' }
#' @source simulated data.
#'
"social"

#' Social, institution, and technology dimensions data set
#'
#' A simulation dataset containing three components, i.e. social,
#' institution, and technology dimensions.
#' It has eight variables/ indicators of 12 locations measured for
#' their scores/ indices. Social indicators are column number 1 to 8,
#' institution variables are column number 9 to 15, and
#' the rest are technology indicators.
#' The minimum score is 0, and the maximum is 10.
#'
#' @format A data frame with 12 rows and 20 variables:
#' \describe{
#'   \item{educ}{Education index.}
#'   \item{prosper}{Prosperity potential.}
#'   \item{care}{Social caring.}
#'   \item{suitable}{Index of suitability.}
#'   \item{otherAct}{Other activities.}
#'   \item{Wpoktan}{Group of farming.}
#'   \item{Wmanage}{Group management.}
#'   \item{conflict}{Potential of conflict.}
#'   \item{participate}{Participation index.}
#'   \item{intensity}{Instensity of activities.}
#'   \item{subtitute}{Subtitute organization.}
#'   \item{cooperation}{Index of cooperation.}
#'   \item{market}{Potential market.}
#'   \item{ikm}{small enterprise.}
#'   \item{integrate}{Integration a new information.}
#'   \item{maintain}{Maintainance activities.}
#'   \item{acceptance}{Acceptance index.}
#'   \item{management}{Management index.}
#'   \item{poultry}{Poultry activites.}
#'   \item{fertilizer}{Fertilizer usage.}
#' }
#' @source simulated data.
#'
"three"

#' Influence–interest stakeholder data set
#'
#' A simulation dataset containing two component, i.e. influence and
#' interest dimensions. It has five objects of stakeholders and
#' 10 variables consisting of both 5 influence and interest indicators.
#' The minimum score is 0, and the maximum is 5.
#'
#' @format A data frame with 12 rows and 8 variables:
#' \describe{
#'   \item{Influ.1}{Influence indicator 1: influence in the management.}
#'   \item{Influ.2}{Influence indicator 2: budget contribution.}
#'   \item{Influ.3}{Influence indicator 3: institution capacity}
#'   \item{Influ.4}{Influence indicator 4: dependentcy level.}
#'   \item{Influ.5}{Influence indicator 5: cooperation intensity.}
#'   \item{Inter.1}{Interest indicator 1: engagement.}
#'   \item{Inter.2}{Interest indicator 2: existing benefit.}
#'   \item{Inter.3}{Interest indicator 3: autority.}
#'   \item{Inter.4}{Interest indicator 4: program.}
#'   \item{Inter.5}{Interest indicator 5: program impact.}
#' }
#' @source simulated data.
#'
"sldata"

#' Rapfish simulation data set 1
#'
#' A simulation dataset contains five dimensions, i.e. ecological, economic,
#' social, technology, and institution dimensions.
#' It has 30 variables of 10 locations measured for their scores/ indices.
#' Each dimension consists six indicators (equal number of indicators).
#' The minimum score is 1, and the maximum is 5.
#'
#' @format A data frame with 10 rows and 30 variables:
#' \describe{
#'   \item{ecol1}{Indicator 1 of ecological dimension.}
#'   \item{ecol2}{Indicator 2 of ecological dimension.}
#'   \item{ecol3}{Indicator 3 of ecological dimension.}
#'   \item{ecol4}{Indicator 4 of ecological dimension.}
#'   \item{ecol5}{Indicator 5 of ecological dimension.}
#'   \item{ecol6}{Indicator 6 of ecological dimension.}
#'   \item{econ1}{Indicator 1 of economic dimension.}
#'   \item{econ2}{Indicator 2 of economic dimension.}
#'   \item{econ3}{Indicator 3 of economic dimension.}
#'   \item{econ4}{Indicator 4 of economic dimension.}
#'   \item{econ5}{Indicator 5 of economic dimension.}
#'   \item{econ6}{Indicator 6 of economic dimension.}
#'   \item{soc1}{Indicator 1 of social dimension.}
#'   \item{soc2}{Indicator 2 of social dimension.}
#'   \item{soc3}{Indicator 3 of social dimension.}
#'   \item{soc4}{Indicator 4 of social dimension.}
#'   \item{soc5}{Indicator 5 of social dimension.}
#'   \item{soc6}{Indicator 6 of social dimension.}
#'   \item{tech1}{Indicator 1 of technology dimension.}
#'   \item{tech2}{Indicator 2 of technology dimension.}
#'   \item{tech3}{Indicator 3 of technology dimension.}
#'   \item{tech4}{Indicator 4 of technology dimension.}
#'   \item{tech5}{Indicator 5 of technology dimension.}
#'   \item{tech6}{Indicator 6 of technology dimension.}
#'   \item{inst1}{Indicator 1 of institution dimension.}
#'   \item{inst2}{Indicator 2 of institution dimension.}
#'   \item{inst3}{Indicator 3 of institution dimension.}
#'   \item{inst4}{Indicator 4 of institution dimension.}
#'   \item{inst5}{Indicator 5 of institution dimension.}
#'   \item{inst6}{Indicator 6 of institution dimension.}
#'
#' }
#' @source simulated data.
#'
"RapEqualScale15n10"

#' Rapfish simulation data set 2
#'
#' A simulation dataset contains five dimensions, i.e. ecological, economic,
#' social, technology, and institution dimensions.
#' It has 15 variables of 100 locations measured for their scores/ indices.
#' Each dimension consists three indicators (equal number of indicators).
#' The minimum score is 1, and the maximum is 5.
#'
#' @format A data frame with 100 rows and 15 variables:
#' \describe{
#'   \item{ecol1}{Indicator 1 of ecological dimension.}
#'   \item{ecol2}{Indicator 2 of ecological dimension.}
#'   \item{ecol3}{Indicator 3 of ecological dimension.}
#'   \item{econ1}{Indicator 1 of economic dimension.}
#'   \item{econ2}{Indicator 2 of economic dimension.}
#'   \item{econ3}{Indicator 3 of economic dimension.}
#'   \item{soc1}{Indicator 1 of social dimension.}
#'   \item{soc2}{Indicator 2 of social dimension.}
#'   \item{soc3}{Indicator 3 of social dimension.}
#'   \item{tech1}{Indicator 1 of technology dimension.}
#'   \item{tech2}{Indicator 2 of technology dimension.}
#'   \item{tech3}{Indicator 3 of technology dimension.}
#'   \item{inst1}{Indicator 1 of institution dimension.}
#'   \item{inst2}{Indicator 2 of institution dimension.}
#'   \item{inst3}{Indicator 3 of institution dimension.}
#'
#' }
#' @source simulated data.
#'
"RapEqualScale15n100"

#' Rapfish simulation data set 3
#'
#' A simulation dataset contains five dimensions, i.e. ecological, economic,
#' social, technology, and institution dimensions.
#' It has 10 variables of 1000 locations measured for their scores/ indices.
#' Each dimension consists two indicators (equal number of indicators).
#' The minimum score is 1, and the maximum is 5.
#'
#' @format A data frame with 100 rows and 15 variables:
#' \describe{
#'   \item{ecol1}{Indicator 1 of ecological dimension.}
#'   \item{ecol2}{Indicator 2 of ecological dimension.}
#'   \item{econ1}{Indicator 1 of economic dimension.}
#'   \item{econ2}{Indicator 2 of economic dimension.}
#'   \item{soc1}{Indicator 1 of social dimension.}
#'   \item{soc2}{Indicator 2 of social dimension.}
#'   \item{tech1}{Indicator 1 of technology dimension.}
#'   \item{tech2}{Indicator 2 of technology dimension.}
#'   \item{inst1}{Indicator 1 of institution dimension.}
#'   \item{inst2}{Indicator 2 of institution dimension.}
#'
#' }
#' @source simulated data.
#'
"RapEqualScale15n1000"

#' Rapfish simulation data set 4
#'
#' A simulation dataset contains five dimensions, i.e. ecological, economic,
#' social, technology, and institution dimensions.
#' It has 35 variables of 10 locations measured for their scores/ indices.
#' Each dimension consists seven indicators (equal number of indicators).
#' The minimum score is 1, and the maximum is 100.
#'
#' @format A data frame with 10 rows and 30 variables:
#' \describe{
#'   \item{ecol1}{Indicator 1 of ecological dimension.}
#'   \item{ecol2}{Indicator 2 of ecological dimension.}
#'   \item{ecol3}{Indicator 3 of ecological dimension.}
#'   \item{ecol4}{Indicator 4 of ecological dimension.}
#'   \item{ecol5}{Indicator 5 of ecological dimension.}
#'   \item{ecol6}{Indicator 6 of ecological dimension.}
#'   \item{ecol7}{Indicator 7 of ecological dimension.}
#'   \item{econ1}{Indicator 1 of economic dimension.}
#'   \item{econ2}{Indicator 2 of economic dimension.}
#'   \item{econ3}{Indicator 3 of economic dimension.}
#'   \item{econ4}{Indicator 4 of economic dimension.}
#'   \item{econ5}{Indicator 5 of economic dimension.}
#'   \item{econ6}{Indicator 6 of economic dimension.}
#'   \item{econ7}{Indicator 7 of economic dimension.}
#'   \item{soc1}{Indicator 1 of social dimension.}
#'   \item{soc2}{Indicator 2 of social dimension.}
#'   \item{soc3}{Indicator 3 of social dimension.}
#'   \item{soc4}{Indicator 4 of social dimension.}
#'   \item{soc5}{Indicator 5 of social dimension.}
#'   \item{soc6}{Indicator 6 of social dimension.}
#'   \item{soc7}{Indicator 7 of social dimension.}
#'   \item{tech1}{Indicator 1 of technology dimension.}
#'   \item{tech2}{Indicator 2 of technology dimension.}
#'   \item{tech3}{Indicator 3 of technology dimension.}
#'   \item{tech4}{Indicator 4 of technology dimension.}
#'   \item{tech5}{Indicator 5 of technology dimension.}
#'   \item{tech6}{Indicator 6 of technology dimension.}
#'   \item{tech7}{Indicator 7 of technology dimension.}
#'   \item{inst1}{Indicator 1 of institution dimension.}
#'   \item{inst2}{Indicator 2 of institution dimension.}
#'   \item{inst3}{Indicator 3 of institution dimension.}
#'   \item{inst4}{Indicator 4 of institution dimension.}
#'   \item{inst5}{Indicator 5 of institution dimension.}
#'   \item{inst6}{Indicator 6 of institution dimension.}
#'   \item{inst7}{Indicator 7 of institution dimension.}
#'
#' }
#' @source simulated data.
#'
"RapEqualScale1100n10"

#' Rapfish simulation data set 5
#'
#' A simulation dataset contains five dimensions, i.e. ecological, economic,
#' social, technology, and institution dimensions.
#' It has 20 variables of 100 locations measured for their scores/ indices.
#' Each dimension consists four indicators (equal number of indicators).
#' The minimum score is 1, and the maximum is 100.
#'
#' @format A data frame with 10 rows and 30 variables:
#' \describe{
#'   \item{ecol1}{Indicator 1 of ecological dimension.}
#'   \item{ecol2}{Indicator 2 of ecological dimension.}
#'   \item{ecol3}{Indicator 3 of ecological dimension.}
#'   \item{ecol4}{Indicator 4 of ecological dimension.}
#'   \item{econ1}{Indicator 1 of economic dimension.}
#'   \item{econ2}{Indicator 2 of economic dimension.}
#'   \item{econ3}{Indicator 3 of economic dimension.}
#'   \item{econ4}{Indicator 4 of economic dimension.}
#'   \item{soc1}{Indicator 1 of social dimension.}
#'   \item{soc2}{Indicator 2 of social dimension.}
#'   \item{soc3}{Indicator 3 of social dimension.}
#'   \item{soc4}{Indicator 4 of social dimension.}
#'   \item{tech1}{Indicator 1 of technology dimension.}
#'   \item{tech2}{Indicator 2 of technology dimension.}
#'   \item{tech3}{Indicator 3 of technology dimension.}
#'   \item{tech4}{Indicator 4 of technology dimension.}
#'   \item{inst1}{Indicator 1 of institution dimension.}
#'   \item{inst2}{Indicator 2 of institution dimension.}
#'   \item{inst3}{Indicator 3 of institution dimension.}
#'   \item{inst4}{Indicator 4 of institution dimension.}
#'
#' }
#' @source simulated data.
#'
"RapEqualScale1100n100"

#' Rapfish simulation data set 6
#'
#' A simulation dataset contains five dimensions, i.e. ecological, economic,
#' social, technology, and institution dimensions.
#' It has 40 variables of 1000 locations measured for their scores/ indices.
#' Each dimension consists seven indicators (equal number of indicators).
#' The minimum score is 1, and the maximum is 100.
#'
#' @format A data frame with 10 rows and 30 variables:
#' \describe{
#'   \item{ecol1}{Indicator 1 of ecological dimension.}
#'   \item{ecol2}{Indicator 2 of ecological dimension.}
#'   \item{ecol3}{Indicator 3 of ecological dimension.}
#'   \item{ecol4}{Indicator 4 of ecological dimension.}
#'   \item{ecol5}{Indicator 5 of ecological dimension.}
#'   \item{ecol6}{Indicator 6 of ecological dimension.}
#'   \item{ecol7}{Indicator 7 of ecological dimension.}
#'   \item{ecol8}{Indicator 8 of ecological dimension.}
#'   \item{econ1}{Indicator 1 of economic dimension.}
#'   \item{econ2}{Indicator 2 of economic dimension.}
#'   \item{econ3}{Indicator 3 of economic dimension.}
#'   \item{econ4}{Indicator 4 of economic dimension.}
#'   \item{econ5}{Indicator 5 of economic dimension.}
#'   \item{econ6}{Indicator 6 of economic dimension.}
#'   \item{econ7}{Indicator 7 of economic dimension.}
#'   \item{econ8}{Indicator 8 of economic dimension.}
#'   \item{soc1}{Indicator 1 of social dimension.}
#'   \item{soc2}{Indicator 2 of social dimension.}
#'   \item{soc3}{Indicator 3 of social dimension.}
#'   \item{soc4}{Indicator 4 of social dimension.}
#'   \item{soc5}{Indicator 5 of social dimension.}
#'   \item{soc6}{Indicator 6 of social dimension.}
#'   \item{soc7}{Indicator 7 of social dimension.}
#'   \item{soc8}{Indicator 8 of social dimension.}
#'   \item{tech1}{Indicator 1 of technology dimension.}
#'   \item{tech2}{Indicator 2 of technology dimension.}
#'   \item{tech3}{Indicator 3 of technology dimension.}
#'   \item{tech4}{Indicator 4 of technology dimension.}
#'   \item{tech5}{Indicator 5 of technology dimension.}
#'   \item{tech6}{Indicator 6 of technology dimension.}
#'   \item{tech7}{Indicator 7 of technology dimension.}
#'   \item{tech8}{Indicator 8 of technology dimension.}
#'   \item{inst1}{Indicator 1 of institution dimension.}
#'   \item{inst2}{Indicator 2 of institution dimension.}
#'   \item{inst3}{Indicator 3 of institution dimension.}
#'   \item{inst4}{Indicator 4 of institution dimension.}
#'   \item{inst5}{Indicator 5 of institution dimension.}
#'   \item{inst6}{Indicator 6 of institution dimension.}
#'   \item{inst7}{Indicator 7 of institution dimension.}
#'   \item{inst8}{Indicator 8 of institution dimension.}
#' }
#' @source simulated data.
#'
"RapEqualScale1100n1000"

#' Rapfish simulation data set 7
#'
#' A simulation dataset contains five dimensions, i.e. ecological, economic,
#' social, technology, and institution dimensions.
#' It has 26 variables of 10 locations measured for their scores/ indices.
#' Each dimension consists an unequal number of indicators.
#' The minimum score is 1, and the maximum is 5.
#'
#' @format A data frame with 10 rows and 26 variables:
#' \describe{
#'   \item{ecol1}{Indicator 1 of ecological dimension.}
#'   \item{ecol2}{Indicator 2 of ecological dimension.}
#'   \item{ecol3}{Indicator 3 of ecological dimension.}
#'   \item{ecol4}{Indicator 4 of ecological dimension.}
#'   \item{ecol5}{Indicator 5 of ecological dimension.}
#'   \item{econ1}{Indicator 1 of economic dimension.}
#'   \item{econ2}{Indicator 2 of economic dimension.}
#'   \item{econ3}{Indicator 3 of economic dimension.}
#'   \item{econ4}{Indicator 4 of economic dimension.}
#'   \item{econ5}{Indicator 5 of economic dimension.}
#'   \item{econ6}{Indicator 6 of economic dimension.}
#'   \item{econ7}{Indicator 7 of economic dimension.}
#'   \item{econ8}{Indicator 8 of economic dimension.}
#'   \item{soc1}{Indicator 1 of social dimension.}
#'   \item{soc2}{Indicator 2 of social dimension.}
#'   \item{soc3}{Indicator 3 of social dimension.}
#'   \item{soc4}{Indicator 4 of social dimension.}
#'   \item{soc5}{Indicator 5 of social dimension.}
#'   \item{soc6}{Indicator 6 of social dimension.}
#'   \item{tech1}{Indicator 1 of technology dimension.}
#'   \item{tech2}{Indicator 2 of technology dimension.}
#'   \item{tech3}{Indicator 3 of technology dimension.}
#'   \item{tech4}{Indicator 4 of technology dimension.}
#'   \item{inst1}{Indicator 1 of institution dimension.}
#'   \item{inst2}{Indicator 2 of institution dimension.}
#'   \item{inst3}{Indicator 3 of institution dimension.}
#' }
#' @source simulated data.
#'
"RapUnequalScale15n10"

#' Rapfish simulation data set 8
#'
#' A simulation dataset contains five dimensions, i.e. ecological, economic,
#' social, technology, and institution dimensions.
#' It has 29 variables of 100 locations measured for their scores/ indices.
#' Each dimension consists an unequal number of indicators.
#' The minimum score is 1, and the maximum is 5.
#'
#' @format A data frame with 100 rows and 29 variables:
#' \describe{
#'   \item{ecol1}{Indicator 1 of ecological dimension.}
#'   \item{ecol2}{Indicator 2 of ecological dimension.}
#'   \item{ecol3}{Indicator 3 of ecological dimension.}
#'   \item{ecol4}{Indicator 4 of ecological dimension.}
#'   \item{econ1}{Indicator 1 of economic dimension.}
#'   \item{econ2}{Indicator 2 of economic dimension.}
#'   \item{econ3}{Indicator 3 of economic dimension.}
#'   \item{econ4}{Indicator 4 of economic dimension.}
#'   \item{econ5}{Indicator 5 of economic dimension.}
#'   \item{econ6}{Indicator 6 of economic dimension.}
#'   \item{econ7}{Indicator 7 of economic dimension.}
#'   \item{econ8}{Indicator 8 of economic dimension.}
#'   \item{soc1}{Indicator 1 of social dimension.}
#'   \item{soc2}{Indicator 2 of social dimension.}
#'   \item{soc3}{Indicator 3 of social dimension.}
#'   \item{tech1}{Indicator 1 of technology dimension.}
#'   \item{tech2}{Indicator 2 of technology dimension.}
#'   \item{tech3}{Indicator 3 of technology dimension.}
#'   \item{tech4}{Indicator 4 of technology dimension.}
#'   \item{tech5}{Indicator 5 of technology dimension.}
#'   \item{inst1}{Indicator 1 of institution dimension.}
#'   \item{inst2}{Indicator 2 of institution dimension.}
#'   \item{inst3}{Indicator 3 of institution dimension.}
#'   \item{inst4}{Indicator 4 of institution dimension.}
#'   \item{inst5}{Indicator 5 of institution dimension.}
#'   \item{inst6}{Indicator 6 of institution dimension.}
#'   \item{inst7}{Indicator 7 of institution dimension.}
#'   \item{inst8}{Indicator 8 of institution dimension.}
#'   \item{inst9}{Indicator 9 of institution dimension.}
#' }
#' @source simulated data.
#'
"RapUnequalScale15n100"

#' Rapfish simulation data set 9
#'
#' A simulation dataset contains five dimensions, i.e. ecological, economic,
#' social, technology, and institution dimensions.
#' It has 29 variables of 1000 locations measured for their scores/ indices.
#' Each dimension consists an unequal number of indicators.
#' The minimum score is 1, and the maximum is 5.
#'
#' @format A data frame with 1000 rows and 29 variables:
#' \describe{
#'   \item{ecol1}{Indicator 1 of ecological dimension.}
#'   \item{ecol2}{Indicator 2 of ecological dimension.}
#'   \item{ecol3}{Indicator 3 of ecological dimension.}
#'   \item{ecol4}{Indicator 4 of ecological dimension.}
#'   \item{ecol5}{Indicator 5 of ecological dimension.}
#'   \item{ecol6}{Indicator 6 of ecological dimension.}
#'   \item{ecol7}{Indicator 7 of ecological dimension.}
#'   \item{econ1}{Indicator 1 of economic dimension.}
#'   \item{econ2}{Indicator 2 of economic dimension.}
#'   \item{econ3}{Indicator 3 of economic dimension.}
#'   \item{econ4}{Indicator 4 of economic dimension.}
#'   \item{econ5}{Indicator 5 of economic dimension.}
#'   \item{soc1}{Indicator 1 of social dimension.}
#'   \item{soc2}{Indicator 2 of social dimension.}
#'   \item{soc3}{Indicator 3 of social dimension.}
#'   \item{soc4}{Indicator 4 of social dimension.}
#'   \item{soc5}{Indicator 5 of social dimension.}
#'   \item{soc6}{Indicator 6 of social dimension.}
#'   \item{soc7}{Indicator 7 of social dimension.}
#'   \item{soc8}{Indicator 8 of social dimension.}
#'   \item{tech1}{Indicator 1 of technology dimension.}
#'   \item{tech2}{Indicator 2 of technology dimension.}
#'   \item{tech3}{Indicator 3 of technology dimension.}
#'   \item{tech4}{Indicator 4 of technology dimension.}
#'   \item{tech5}{Indicator 5 of technology dimension.}
#'   \item{tech6}{Indicator 6 of technology dimension.}
#'   \item{inst1}{Indicator 1 of institution dimension.}
#'   \item{inst2}{Indicator 2 of institution dimension.}
#'   \item{inst3}{Indicator 3 of institution dimension.}
#' }
#' @source simulated data.
#'
"RapUnequalScale15n1000"

#' Rapfish simulation data set 10
#'
#' A simulation dataset contains five dimensions, i.e. ecological, economic,
#' social, technology, and institution dimensions.
#' It has 27 variables of 10 locations measured for their scores/ indices.
#' Each dimension consists an unequal number of indicators.
#' The minimum score is 1, and the maximum is 100.
#'
#' @format A data frame with 10 rows and 27 variables:
#' \describe{
#'   \item{ecol1}{Indicator 1 of ecological dimension.}
#'   \item{ecol2}{Indicator 2 of ecological dimension.}
#'   \item{ecol3}{Indicator 3 of ecological dimension.}
#'   \item{ecol4}{Indicator 4 of ecological dimension.}
#'   \item{ecol5}{Indicator 5 of ecological dimension.}
#'   \item{econ1}{Indicator 1 of economic dimension.}
#'   \item{econ2}{Indicator 2 of economic dimension.}
#'   \item{econ3}{Indicator 3 of economic dimension.}
#'   \item{econ4}{Indicator 4 of economic dimension.}
#'   \item{soc1}{Indicator 1 of social dimension.}
#'   \item{soc2}{Indicator 2 of social dimension.}
#'   \item{soc3}{Indicator 3 of social dimension.}
#'   \item{soc4}{Indicator 4 of social dimension.}
#'   \item{soc5}{Indicator 5 of social dimension.}
#'   \item{soc6}{Indicator 6 of social dimension.}
#'   \item{soc7}{Indicator 7 of social dimension.}
#'   \item{soc8}{Indicator 8 of social dimension.}
#'   \item{soc9}{Indicator 9 of social dimension.}
#'   \item{tech1}{Indicator 1 of technology dimension.}
#'   \item{tech2}{Indicator 2 of technology dimension.}
#'   \item{inst1}{Indicator 1 of institution dimension.}
#'   \item{inst2}{Indicator 2 of institution dimension.}
#'   \item{inst3}{Indicator 3 of institution dimension.}
#'   \item{inst4}{Indicator 4 of institution dimension.}
#'   \item{inst5}{Indicator 5 of institution dimension.}
#'   \item{inst6}{Indicator 6 of institution dimension.}
#'   \item{inst7}{Indicator 7 of institution dimension.}
#' }
#' @source simulated data.
#'
"RapUnequalScale1100n10"

#' Rapfish simulation data set 11
#'
#' A simulation dataset contains five dimensions, i.e. ecological, economic,
#' social, technology, and institution dimensions.
#' It has 21 variables of 100 locations measured for their scores/ indices.
#' Each dimension consists an unequal number of indicators.
#' The minimum score is 1, and the maximum is 100.
#'
#' @format A data frame with 100 rows and 21 variables:
#' \describe{
#'   \item{ecol1}{Indicator 1 of ecological dimension.}
#'   \item{ecol2}{Indicator 2 of ecological dimension.}
#'   \item{ecol3}{Indicator 3 of ecological dimension.}
#'   \item{ecol4}{Indicator 4 of ecological dimension.}
#'   \item{ecol5}{Indicator 5 of ecological dimension.}
#'   \item{econ1}{Indicator 1 of economic dimension.}
#'   \item{econ2}{Indicator 2 of economic dimension.}
#'   \item{econ3}{Indicator 3 of economic dimension.}
#'   \item{econ4}{Indicator 4 of economic dimension.}
#'   \item{soc1}{Indicator 1 of social dimension.}
#'   \item{soc2}{Indicator 2 of social dimension.}
#'   \item{soc3}{Indicator 3 of social dimension.}
#'   \item{soc4}{Indicator 4 of social dimension.}
#'   \item{soc5}{Indicator 5 of social dimension.}
#'   \item{soc6}{Indicator 6 of social dimension.}
#'   \item{soc7}{Indicator 7 of social dimension.}
#'   \item{tech1}{Indicator 1 of technology dimension.}
#'   \item{tech2}{Indicator 2 of technology dimension.}
#'   \item{tech3}{Indicator 3 of technology dimension.}
#'   \item{inst1}{Indicator 1 of institution dimension.}
#'   \item{inst2}{Indicator 2 of institution dimension.}
#' }
#' @source simulated data.
#'
"RapUnequalScale1100n100"

#' Rapfish simulation data set 12
#'
#' A simulation dataset contains five dimensions, i.e. ecological, economic,
#' social, technology, and institution dimensions.
#' It has 27 variables of 1000 locations measured for their scores/ indices.
#' Each dimension consists an unequal number of indicators.
#' The minimum score is 1, and the maximum is 100.
#'
#' @format A data frame with 10 rows and 30 variables:
#' \describe{
#'   \item{ecol1}{Indicator 1 of ecological dimension.}
#'   \item{ecol2}{Indicator 2 of ecological dimension.}
#'   \item{econ1}{Indicator 1 of economic dimension.}
#'   \item{econ2}{Indicator 2 of economic dimension.}
#'   \item{econ3}{Indicator 3 of economic dimension.}
#'   \item{econ4}{Indicator 4 of economic dimension.}
#'   \item{econ5}{Indicator 5 of economic dimension.}
#'   \item{soc1}{Indicator 1 of social dimension.}
#'   \item{soc2}{Indicator 2 of social dimension.}
#'   \item{soc3}{Indicator 3 of social dimension.}
#'   \item{soc4}{Indicator 4 of social dimension.}
#'   \item{tech1}{Indicator 1 of technology dimension.}
#'   \item{tech2}{Indicator 2 of technology dimension.}
#'   \item{tech3}{Indicator 3 of technology dimension.}
#'   \item{tech4}{Indicator 4 of technology dimension.}
#'   \item{tech5}{Indicator 5 of technology dimension.}
#'   \item{tech6}{Indicator 6 of technology dimension.}
#'   \item{tech7}{Indicator 7 of technology dimension.}
#'   \item{tech8}{Indicator 8 of technology dimension.}
#'   \item{tech9}{Indicator 9 of technology dimension.}
#'   \item{inst1}{Indicator 1 of institution dimension.}
#'   \item{inst2}{Indicator 2 of institution dimension.}
#'   \item{inst3}{Indicator 3 of institution dimension.}
#'   \item{inst4}{Indicator 4 of institution dimension.}
#'   \item{inst5}{Indicator 5 of institution dimension.}
#'   \item{inst6}{Indicator 6 of institution dimension.}
#'   \item{inst7}{Indicator 7 of institution dimension.}
#' }
#' @source simulated data.
#'
"RapUnequalScale1100n1000"

#' Lvi simulation data set 1
#'
#' A simulation dataset contains five dimensions, i.e. human, natur,
#' physic, financial, an social dimensions.
#' It has 10 variables of 10 locations measured for their scores/ indices.
#' For each dimension consists two indicators (equal number of indicators).
#' The minimum score is 1, and the maximum is 5.
#'
#' @format A data frame with 10 rows and 30 variables:
#' \describe{
#'   \item{human1}{Indicator 1 of human dimension.}
#'   \item{human2}{Indicator 2 of human dimension.}
#'   \item{natur1}{Indicator 1 of natur dimension.}
#'   \item{natur2}{Indicator 2 of natur dimension.}
#'   \item{phys1}{Indicator 1 of physic dimension.}
#'   \item{phys2}{Indicator 2 of physic dimension.}
#'   \item{fin1}{Indicator 1 of financial dimension.}
#'   \item{fin2}{Indicator 2 of financial dimension.}
#'   \item{soc1}{Indicator 1 of social dimension.}
#'   \item{soc2}{Indicator 2 of social dimension.}
#'
#' }
#' @source simulated data.
#'
"LviEqualScale15n10"

#' Influence interest simulation data set 1
#'
#' A simulation dataset contains ten indicators.
#' It has 10 variables of 10 locations measured for their scores/ indices.
#' The minimum score is 1, and the maximum is 5.
#'
#' @format A data frame with 10 rows and 10 variables:
#' \describe{
#'   \item{manag}{management authority.}
#'   \item{budget}{budget contribution.}
#'   \item{inst}{institutional capacity.}
#'   \item{depen}{dependency level.}
#'   \item{colab}{collaboration intensity.}
#'   \item{invol}{program involvement.}
#'   \item{benef}{perceived benefits.}
#'   \item{author}{management responsibility.}
#'   \item{parti}{stakeholder participationn.}
#'   \item{impact}{program impacts.}
#'
#' }
#' @source simulated data.
#'
"IiScale15n10"

#' Influence interest simulation data set 2
#'
#' A simulation dataset contains ten indicators.
#' It has 10 variables of 10 locations measured for their scores/ indices.
#' The minimum score is 1, and the maximum is 100.
#'
#' @format A data frame with 100 rows and 10 variables:
#' \describe{
#'   \item{manag}{management authority.}
#'   \item{budget}{budget contribution.}
#'   \item{inst}{institutional capacity.}
#'   \item{depen}{dependency level.}
#'   \item{colab}{collaboration intensity.}
#'   \item{invol}{program involvement.}
#'   \item{benef}{perceived benefits.}
#'   \item{author}{management responsibility.}
#'   \item{parti}{stakeholder participationn.}
#'   \item{impact}{program impacts.}
#'
#' }
#' @source simulated data.
#'
"IiScale1100n100"

