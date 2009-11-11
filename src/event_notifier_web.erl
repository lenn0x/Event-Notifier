%% @author Chris Goffinet <cg@chrisgoffinet.com>
%% @copyright 2009.

%% @doc Web server for event_notifier.

-module(event_notifier_web).
-author('Chris Goffinet <cg@chrisgoffinet.com>').

-export([start/1, stop/0, loop/1]).
-define(TimeOut, 60).

%% External API

start(Options) ->
    {DocRoot, Options1} = get_option(docroot, Options),
    
    Loop = fun (Req) ->
                   ?MODULE:loop(Req)
           end,
           
    router:start_link(),
    scribe:start(),
    mochiweb_http:start([{name, ?MODULE}, {loop, Loop} | Options1]).

stop() ->
    mochiweb_http:stop(?MODULE).
    
loop(Req) ->
    "/" ++ Path = Req:get(path),
    case Req:get(method) of
        Method when Method =:= 'GET'; Method =:= 'HEAD' ->
            case Path of
                
                "subscribe/" ++ Id ->
                    Response = Req:ok({"text/html; charset=utf-8", [{"Server","Scribe Event Notifier"}], chunked}),
                    {ok, Hooks} = regexp:split(Id, ","),
                    lists:foreach(fun(Id) -> router:login(list_to_binary(Id), self()) end, Hooks),
                    IdBin = list_to_binary(Id),
                    feed(Response, IdBin, 1);
                _ ->
                    Req:not_found()
            end;
        'POST' ->
            case Path of
                _ ->
                    Req:not_found()
            end;
        _ ->
            Req:respond({501, [], []})
    end.

feed(Response, Id, N) ->
    receive
        {router_msg, Msg} ->
            Response:write_chunk(Msg)
    end,
    feed(Response, Id, N+1).
%% Internal API

get_option(Option, Options) ->
    {proplists:get_value(Option, Options), proplists:delete(Option, Options)}.
