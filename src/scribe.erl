-module(scribe).

-include("scribe_thrift.hrl").

-export([start/0, start/1, handle_function/2,
         stop/1, log/1]).

debug(Format, Data) ->
    error_logger:info_msg(Format, Data).

log(LogEntries) ->
    spawn(fun() -> lists:foreach(fun(T) -> 
        {logEntry, Category, Msg} = T,
        router:send(Category, [Msg, <<"\n">>])
        end, LogEntries) end),
    0.

%%

start() ->
    start(1464).

start(Port) ->
    Handler   = ?MODULE,
    thrift_socket_server:start([{handler, Handler},
                                {service, scribe_thrift},
                                {port, Port},
                                {framed, true},
                                {socket_opts, [{recv_timeout, infinity}]},
                                {name, scribe_server}]).

stop(Server) ->
    thrift_socket_server:stop(Server).

handle_function(Function, Args) when is_atom(Function), is_tuple(Args) ->
    case apply(?MODULE, log, tuple_to_list(Args)) of
        ok -> ok;
        Reply -> {reply, Reply}
    end.
