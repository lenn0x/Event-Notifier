%% @author Chris Goffinet <cg@chrisgoffinet.com>
%% @copyright 2009.

%% @doc Callbacks for the event_notifier application.

-module(event_notifier_app).
-author('author <author@example.com>').

-behaviour(application).
-export([start/2,stop/1]).


%% @spec start(_Type, _StartArgs) -> ServerRet
%% @doc application start callback for event_notifier.
start(_Type, _StartArgs) ->
    event_notifier_deps:ensure(),
    event_notifier_sup:start_link().

%% @spec stop(_State) -> ServerRet
%% @doc application stop callback for event_notifier.
stop(_State) ->
    ok.
