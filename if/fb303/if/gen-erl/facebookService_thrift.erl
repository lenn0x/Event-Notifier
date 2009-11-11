%%
%% Autogenerated by Thrift
%%
%% DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
%%

-module(facebookService_thrift).
-behaviour(thrift_service).


-include("facebookService_thrift.hrl").

-export([struct_info/1, function_info/2]).

struct_info('i am a dummy struct') -> undefined.
%%% interface
% getName(This)
function_info('getName', params_type) ->
  {struct, []}
;
function_info('getName', reply_type) ->
  string;
function_info('getName', exceptions) ->
  {struct, []}
;
% getVersion(This)
function_info('getVersion', params_type) ->
  {struct, []}
;
function_info('getVersion', reply_type) ->
  string;
function_info('getVersion', exceptions) ->
  {struct, []}
;
% getStatus(This)
function_info('getStatus', params_type) ->
  {struct, []}
;
function_info('getStatus', reply_type) ->
  i32;
function_info('getStatus', exceptions) ->
  {struct, []}
;
% getStatusDetails(This)
function_info('getStatusDetails', params_type) ->
  {struct, []}
;
function_info('getStatusDetails', reply_type) ->
  string;
function_info('getStatusDetails', exceptions) ->
  {struct, []}
;
% getCounters(This)
function_info('getCounters', params_type) ->
  {struct, []}
;
function_info('getCounters', reply_type) ->
  {map, string, i64};
function_info('getCounters', exceptions) ->
  {struct, []}
;
% getCounter(This, Key)
function_info('getCounter', params_type) ->
  {struct, [{1, string}]}
;
function_info('getCounter', reply_type) ->
  i64;
function_info('getCounter', exceptions) ->
  {struct, []}
;
% setOption(This, Key, Value)
function_info('setOption', params_type) ->
  {struct, [{1, string},
  {2, string}]}
;
function_info('setOption', reply_type) ->
  {struct, []};
function_info('setOption', exceptions) ->
  {struct, []}
;
% getOption(This, Key)
function_info('getOption', params_type) ->
  {struct, [{1, string}]}
;
function_info('getOption', reply_type) ->
  string;
function_info('getOption', exceptions) ->
  {struct, []}
;
% getOptions(This)
function_info('getOptions', params_type) ->
  {struct, []}
;
function_info('getOptions', reply_type) ->
  {map, string, string};
function_info('getOptions', exceptions) ->
  {struct, []}
;
% getCpuProfile(This, ProfileDurationInSec)
function_info('getCpuProfile', params_type) ->
  {struct, [{1, i32}]}
;
function_info('getCpuProfile', reply_type) ->
  string;
function_info('getCpuProfile', exceptions) ->
  {struct, []}
;
% aliveSince(This)
function_info('aliveSince', params_type) ->
  {struct, []}
;
function_info('aliveSince', reply_type) ->
  i64;
function_info('aliveSince', exceptions) ->
  {struct, []}
;
% reinitialize(This)
function_info('reinitialize', params_type) ->
  {struct, []}
;
function_info('reinitialize', reply_type) ->
  oneway_void;
function_info('reinitialize', exceptions) ->
  {struct, []}
;
% shutdown(This)
function_info('shutdown', params_type) ->
  {struct, []}
;
function_info('shutdown', reply_type) ->
  oneway_void;
function_info('shutdown', exceptions) ->
  {struct, []}
;
function_info(xxx, dummy) -> dummy.

