import React from 'react';

/**
 * Allow an async action to throw a regular error that will be caught be our react error boundary.
 * @example
 * const throwError = useAsyncError();
 * try {
 *  await someAsyncFunction();
 * } catch (error) {
 *  throwError(error);
 * }
 */
export const useAsyncError = () => {
  // eslint-disable-next-line @typescript-eslint/no-unused-vars
  const [_, setError] = React.useState();
  return React.useCallback(
    (e: unknown) => {
      setError(() => {
        throw e;
      });
    },
    [setError],
  );
};
