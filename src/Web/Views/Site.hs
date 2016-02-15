{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}
module Web.Views.Site where

import Model.CoreTypes
import System.FilePath

import Control.Monad
import Database.Persist
import Text.Blaze.XHtml5 ((!))
import qualified Data.Text as T
import qualified Text.Blaze.Bootstrap as H
import qualified Text.Blaze.XHtml5 as H
import qualified Text.Blaze.XHtml5.Attributes as A
import Text.Blaze.Html
import Text.Blaze.Html.Renderer.String (renderHtml)
import Text.Hamlet (shamlet, hamlet, hamletFile, shamletFile)
import Data.Char (toLower)
import Data.List (sort)

data SiteView = SiteView { sv_blogName :: T.Text
                         , sv_blogDesc :: T.Text
                         , sv_user     :: Maybe User }

siteTemplate :: FilePath
siteTemplate = "template.hamlet"

siteView :: SiteView -> Html -> Html
siteView sv body = $(shamletFile "src/Web/Views/template.hamlet")

panelWithErrorView :: T.Text -> Maybe T.Text -> H.Html -> H.Html
panelWithErrorView title mError ct = 
    $(shamletFile "src/Web/Views/panelWithErrorView.hamlet")

homeView :: [Entity Post] -> SiteView -> Html
homeView posts sv = $(shamletFile "src/Web/Views/homeview.hamlet")

blogView :: [Entity Post] -> SiteView -> Html
blogView post sv = $(shamletFile "src/Web/Views/blog.hamlet")
