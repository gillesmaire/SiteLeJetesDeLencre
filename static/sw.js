self.addEventListener("install", () => {
  console.log("SW installed");
  self.skipWaiting();
});

self.addEventListener("fetch", () => {});
