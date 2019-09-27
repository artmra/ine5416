Expr ::- Number | Div Expr Expr

data Maybe a = Nothing | Just a
            deriving (Eq, Ord, Read, Show)

instance Monad Maybe where
    Nothing >>= f = Nothing
    (Just x) >>= f = f x
    return = Just

mydiv :: Int -> Int -> Maybe Int
mydiv n m | m == 0 = Nothing
          | otherwise = Just (n 'div' m)

data Expr = Val Int | Div Expr Expr

eval :: Expr -> Maybe Int
eval (Val n) = Just n
eval (Div x y) = case (eval x) of
                        Nothing -> Nothing
                        Just n -> case (eval y) of
                                        Nothing -> Nothing
                                        Just m -> (mydiv n m)

evalmonad :: Expr -> Maybe Int
evalmonad (Val n) = return n
evalmonad (Div x y) = evalmonad x >>=
                      (\n -> evalmonad y >>=
                          \m -> (mydiv n m))

evalfinal :: Expr -> Maybe Int
evalfinal (Val n) = return n
evalfinal (Div x y) = do
    n <- evalfinal x
    m <- evalfinal y
    mydiv n m

main = do
    print (mydiv 5 0)
    print (eval(Div (Val 5) (Val 0)))
    print (eval(Div (val 5) (Val 2)))
    print (evalmonad(Div (Val 5) (Val 0)))
    print (evalmonad(Div (Val 5) (Val 2)))
    print (evalfinal(Div (Val 5) (Val 0)))
    print (evalfinal(Div (Val 5) (Val 2)))  