module Pages.Forms.SendGroup.Remote exposing (postCmd)

import DjangoSend exposing (CSRFToken, rawPost)
import Encode exposing (encodeMaybeDate)
import Http
import Json.Encode as Encode
import Messages exposing (FormMsg(ReceiveFormResp), Msg(FormMsg))
import Navigation as Nav
import Pages as P
import Pages.Forms.SendGroup.Model exposing (SendGroupModel)
import Route exposing (page2loc)
import Urls


postCmd : CSRFToken -> SendGroupModel -> Cmd Msg
postCmd csrf model =
    let
        body =
            [ ( "content", Encode.string model.content )
            , ( "recipient_group", Encode.int (Maybe.withDefault 0 model.selectedPk) )
            , ( "scheduled_time", encodeMaybeDate model.date )
            ]

        newLoc =
            case model.date of
                Nothing ->
                    P.OutboundTable

                Just _ ->
                    P.ScheduledSmsTable
    in
    rawPost csrf Urls.api_act_send_group body
        |> Http.send (FormMsg << ReceiveFormResp [ Nav.newUrl <| page2loc newLoc ])
