require 'httparty'
require 'nokogiri'

#################################### TEAMS #####################################

Team.destroy_all
Team.create :name => 'Netball Regretball'
puts "#{ Team.count } #{ 'team'.pluralize Team.count } created"


################################### FIXTURES ###################################

def scrape_fixtures
  url = 'https://citysidesports.com/fixtures.php?getcomp=9&div=2746'
  unparsed_page = HTTParty.get(url)
  parsed_page = Nokogiri::HTML(unparsed_page.body)

  # CSS class found by inspecting the url's source
  results_div = parsed_page.css('.tab-content').last
  rounds_divs = results_div.css('.tab-pane')

  fixtures = []

  # Each round is contained with a <div>
  rounds_divs.each do |round_div|
    # The round name can be found in the div's id
    round = round_div.attributes["id"].value.split('-')[1] # Returns a string

    # Each fixture per round is contained within a <tr>
    round_div.css('tr').each do |fixture_row|
      columns = fixture_row.css('td').map{ |col| col.text.strip }

      # If the first column says 'BYES:...', create fixtures for all bye teams
      if columns[0].include?('BYES: ')
        if columns[0] != 'BYES: N/A'
          fixtures << {
            round: round,
            home: columns[0].split("BYES: ").drop(1)[0],
            status: 'BYE'
          }
        end
      else
        fixtures << {
          round: round,
          date: columns[0],
          status: columns[1],
          venue: columns[2],
          home: columns[3],
          home_score: columns[4],
          # columns[5] = 'vs.'
          away: columns[6],
          away_score: columns[7],
        }
      end
    end
  end
  fixtures
end

scrape_fixtures
