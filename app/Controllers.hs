{-# LANGUAGE TemplateHaskell #-}
module Controllers where

import Model.CoreTypes
import Database.Persist
import Data.Text as T
import Text.Blaze.Html
import qualified Text.Blaze.Bootstrap as H
import qualified Text.Blaze.XHtml5 as H
import Text.Hamlet (hamletFile, shamletFile)
import Data.Monoid
import Config (static)

data SiteView = SiteView { sv_blogName :: T.Text
                         , sv_blogDesc :: T.Text
                         , sv_user     :: Maybe User }

layoutView :: SiteView -> Html -> Html
layoutView sv body = $(shamletFile "app/Views/layout.hamlet")

panelWithErrorView :: T.Text -> Maybe T.Text -> H.Html -> H.Html
panelWithErrorView title mError ct = do 
    $(shamletFile "app/Views/panelWithErrorView.hamlet")

homeView :: SiteView -> Html
homeView sv = do
    $(shamletFile "app/Views/homeview.hamlet")

blogView :: [Entity Post] -> SiteView -> Html
blogView posts sv = do
    $(shamletFile "app/Views/blog.hamlet")

