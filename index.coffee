# Use this command to load a random comic strip from the past
command: "kp-forecast.widget/parse_kp.py"

# Set the refresh frequency (milliseconds) to every day
refreshFrequency: 60*60*60*1000

style: """

  //color coding Kp
  .kp1 { color: #AAAAFF; }
  .kp2 { color: #AAAAFF; }
  .kp3 { color: #AAAAFF; }
  .kp4 { color: #A966FF; }
  .kp5 { color: #BB44FF; }
  .kp6 { color: #D822FF; }
  .kp7 { color: #FF00FF; }
  .kp8 { color: #DF00B2; }
  .kp9 { color: #BF006F; }


  top: 10px				// Position widget
  left: 510px

  widget-align = left
  color: #fff
  font-family Helvetica Neue
  background rgba(255, 255, 255, .1)
  padding 20px 20px 20px 20px
  border-radius 5px

  #container
    text-align: widget-align
    position: relative
    clear: both


html {
  font-family: "Roboto", "Helvetica", "Arial", sans-serif;
  font-size: 125%;
  line-height: 1.4;
  font-weight: 400;
  color: var(--blue-grey-900);
}

body {
  min-height: 100vh;
  background: var(--blue-grey-100);
}

main {
  max-width: max-content;
  margin: 3em auto 0 auto;
  padding: 1.5em;
  background-color: #fff;
  border: 2px solid var(--blue-grey-200);
  border-radius: 8px;
}

// For the month
.month-indicator {
  color: var(--blue-grey-700);
  text-align: center;
  font-weight: 500;
}

// CSS grid used for the dates
.day-of-week,
.date-grid {
  display: grid;
  grid-template-columns: repeat(7, 1fr);
}

// Styles for the weekday/weekend header
.day-of-week {
  margin-top: 1.25em;
}

.day-of-week > * {
  font-size: 0.7em;
  color: var(--blue-grey-400);
  font-weight: 500;
  letter-spacing: 0.1em;
  font-variant: small-caps;
  text-align: center;
}

/* Dates */
.date-grid {
  margin-top: 0.5em;
}

/* Positioning the first day */
.date-grid button:first-child {
  grid-column: 2;
}

  // Style for each day
  .date-grid button {
    position: relative;
    border: 0;
    width: 4.5ch;
    height: 4.5ch;
    border-radius: 50%;
    background-color: transparent;
  }

  .kp9{
    color: var();
  }

"""

# Render the output.
render: (output) -> """
  <div id='container'>
  <div>
"""

update: (output, domEl) ->
  try

    # xkcd = JSON.parse(output)
    container = $(domEl).find('#container')
    content = output
    $(container).html content
  catch e
    #console.log e
