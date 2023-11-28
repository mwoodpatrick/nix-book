import Data.Map

m :: Map String Int
m = fromList [("cats", 3), ("dogs", 2)]

main :: IO ()
main = do
  let cats = findWithDefault 0 "cats" m
  let dogs = findWithDefault 0 "dogs" m
  let zebras = findWithDefault 0 "zebras" m
  print $ "I have " ++ show cats ++ " cats, " ++ show dogs ++ " dogs, and " ++ show zebras ++ " zebras."
