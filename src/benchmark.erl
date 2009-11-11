-module(benchmark).
-author('Chris Goffinet <goffinet@digg.com>').
-define(PORT, "8000").
-define(USER_AGENT, "Mozilla/5.0 (X11; U; Linux i686; pl-PL; rv:1.9.0.2) Gecko/20121223 Ubuntu/9.25 (jaunty) Firefox/3.8").
-export([start/3, poll/2]).

start(Host, Num, Category) ->
    inets:start(),
    io:format("Spawning ~p clients to ~p",[Num, Host]),
    lists:foreach(fun(X) -> spawn(fun() -> poll(Host, Category) end) end, lists:seq(1, Num)).
        
poll(Host, Category) ->
    Url = "http://" ++ Host ++ ":" ++ ?PORT ++ "/subscribe/" ++ Category,
    http:request(get, {Url, [{"User-Agent", ?USER_AGENT}, {"Host", Host}]}, [], []).
    
