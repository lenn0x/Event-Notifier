%% @author author <author@example.com>
%% @copyright YYYY author.

%% @doc TEMPLATE.

-module(event_notifier).
-author('author <author@example.com>').
-export([start/0, stop/0]).

ensure_started(App) ->
    case application:start(App) of
        ok ->
            ok;
        {error, {already_started, App}} ->
            ok
    end.
        
%% @spec start() -> ok
%% @doc Start the event_notifier server.
start() ->
    event_notifier_deps:ensure(),
    ensure_started(crypto),
    application:start(event_notifier).

%% @spec stop() -> ok
%% @doc Stop the event_notifier server.
stop() ->
    Res = application:stop(event_notifier),
    application:stop(crypto),
    Res.
