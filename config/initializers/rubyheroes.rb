# $voting_enabled allows tests to disable voting by default and enable it
# when necessary
def VotingEnabled?
  return true if $voting_enabled

  Date.today < $end_of_voting
end

$end_of_voting = Date.parse("April 4th, 2016")

# Making this boolean true will link to the previous year's heroes.
$heroes_chosen = false
