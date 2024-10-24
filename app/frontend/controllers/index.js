import { application } from './application';
import { registerControllers } from 'stimulus-vite-helpers';

const controllers = import.meta.glob('./**/*_controller.js', { eager: true });
registerControllers(application, controllers);

// view component assets
import.meta.glob('./**/index.js').forEach(async (path) => {
  const mod = await import(path);
  mod.default();
});
