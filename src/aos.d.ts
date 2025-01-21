declare module 'aos' {
  interface AosOptions {
    duration?: number;
    once?: boolean;
  }

  function init(options?: AosOptions): void;
  
  export default {
    init
  };
} 