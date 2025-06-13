module Expressions where

import Data.Text.Lazy (Text)

{- Program
 - consists of name,
 - a list of parameters,
 - maybe local variables, and
 - body
-}
data Program = Program
    { progName :: Text
    , parameters :: [(Text, Type)]
    , body :: [Stmt]
    }
    deriving (Show)

{- Types
 - booleans
 -}
data Type
    = BoolT
    deriving (Eq, Show)

{- An expression is:
 - boolean
 - binary operator
 - unary operator
-}
data Expr
    = IdE Text
    | BoolE Bool
    | UniversalE Text Expr
    | ExistentialE Text Expr
    | BinOpE BinOp Expr Expr
    | UnaryOpE UnOp Expr
    deriving (Show)

data Stmt
    = Sequential Stmt Stmt
    | Assert Expr
    | Assignment Text Expr
    | Skip
    | If Expr Stmt Stmt
    | Do Expr [Stmt]
    | GeneralAssignment Stmt Expr
    | Specification Stmt Stmt
    deriving (Show)

data Value
    = BoolV Bool
    deriving (Show, Eq)

{- Binary operators -}
data BinOp
    = Equiv
    | Impl
    | And
    | Or
    | GtEq
    | LeEq
    deriving (Show)

{- Unary operators -}
data UnOp = Not
    deriving (Show)
