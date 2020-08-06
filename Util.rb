
def score(dice)
        score = 0
        count_1s = dice.count(1)
        count_2s = dice.count(2)
        count_3s = dice.count(3)
        count_4s = dice.count(4)
        count_5s = dice.count(5)
        count_6s = dice.count(6)
        score += 1000 * (count_1s / 3)
        score += 200 * (count_2s / 3)
        score += 300 * (count_3s / 3)
        score += 400 * (count_4s / 3)
        score += 500 * (count_5s / 3)
        score += 600 * (count_6s / 3)
        score += 100 * (count_1s % 3)
        score += 50  * (count_5s % 3)
end
def number_of_non_scoring_die(dice)
  cur = dice.length
  count_1s = dice.count(1)
  count_2s = dice.count(2)
  count_3s = dice.count(3)
  count_4s = dice.count(4)
  count_5s = dice.count(5)
  count_6s = dice.count(6)
  cur-=count_1s
  cur-=count_5s
  if count_2s >=3 
    cur-=3
  end
  if count_3s >=3 
    cur-=3
  end
  if count_4s >=3 
    cur-=3
  end
  if count_6s >=3 
    cur-=3
  end
  return cur
end