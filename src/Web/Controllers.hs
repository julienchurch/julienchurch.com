{-# LANGUAGE TemplateHaskell #-}
module Web.Controllers where

import Model.CoreTypes
import Database.Persist
import Data.Text as T
import Text.Blaze.Html
import qualified Text.Blaze.Bootstrap as H
import qualified Text.Blaze.XHtml5 as H
import Text.Hamlet (hamletFile, shamletFile)
import Data.Monoid
import Web.Utils

data SiteView = SiteView { sv_blogName :: T.Text
                         , sv_blogDesc :: T.Text
                         , sv_user     :: Maybe User }

layoutView :: SiteView -> Html -> Html
layoutView sv body = $(shamletFile "src/Web/Views/layout.hamlet")

panelWithErrorView :: T.Text -> Maybe T.Text -> H.Html -> H.Html
panelWithErrorView title mError ct = do 
    $(shamletFile "src/Web/Views/panelWithErrorView.hamlet")

homeView :: SiteView -> Html
homeView sv = do
    $(shamletFile "src/Web/Views/homeview.hamlet")

blogView :: [Entity Post] -> SiteView -> Html
blogView posts sv = do
    $(shamletFile "src/Web/Views/blog.hamlet")

