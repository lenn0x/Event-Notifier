{application, event_notifier,
 [{description, "event_notifier"},
  {vsn, "0.01"},
  {modules, [
    event_notifier,
    event_notifier_app,
    event_notifier_sup,
    event_notifier_web,
    event_notifier_deps
  ]},
  {registered, []},
  {mod, {event_notifier_app, []}},
  {env, []},
  {applications, [kernel, stdlib, crypto]}]}.
