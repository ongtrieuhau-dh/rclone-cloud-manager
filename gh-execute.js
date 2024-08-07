const fs = require("fs");
const path = require("path");
var child_process = require("child_process");
const rJS = require("E:/CLOUDCODE/github.com/oListRepos/NodeJS/oModules/rJS.js");
const rNode = require("E:/CLOUDCODE/github.com/oListRepos/NodeJS/oModules/rNode.js");

const executeMain = (async () => {
  const handleError = (error) => {
    console.error(error.message);
    throw error;
  };
  const execSync = (command = "") => {
    try {
      child_process.execSync(command, { cwd: process.cwd(), stdio: "inherit" });
    } catch (error) {
      console.error(error.message);
    }
  };
  const login = () => {
    try {
      execSync(`gh auth login --with-token < ${__filename}.logintoken.gitignorefile`);
    } catch (error) {
      handleError(error);
    } finally {
      execSync(`gh auth status`);
    }
  };
  var v = {
    nameFileTemp: `RCLONE_CONF_BASE64.tmp.gitignorefile`,
  };
  v.tempPathBase64 = path.join(__dirname, v.nameFileTemp);
  try {
    execSync("gh --version");
    login();
    var contentFile = [];
    contentFile.push(`RCLONE_CONF_BASE64 = ${fs.readFileSync(path.join(__dirname, "RCLONE_CONF_BASE64.gitignorefile.conf")).toString("base64")}`);
    contentFile.push(
      `RCLONE_CONF_BASE64_01_ongtrieuhau861ip13pm030 = ${fs
        .readFileSync(path.join(__dirname, ".gitignorefile", "01-ongtrieuhau861.ip13pm.030@gmail.com.gitignorefile"))
        .toString("base64")}`
    );
    contentFile.push(
      `RCLONE_CONF_BASE64_03_ongtrieuhau861ip13pm031 = ${fs
        .readFileSync(`F:/o-photo-rclone/03ongtrieuhau861ip13pm031/config.conf`)
        .toString("base64")}`
    );
    contentFile.push(
      `RCLONE_CONF_BASE64_04_ongtrieuhau861s24ultra031 = ${fs
        .readFileSync(`F:/o-photo-rclone/04ongtrieuhau861s24ultra031/config.conf`)
        .toString("base64")}`
    );
    contentFile.push(
      `RCLONE_CONF_BASE64_02_s24ultra030 = ${fs.readFileSync(`F:/o-photo-rclone/02ongtrieuhau861s24ultra030/config.conf`).toString("base64")}`
    );
    contentFile.push(`RCLONE_CONF_BASE64_05_s24ultra032 = ${fs.readFileSync(`F:/o-photo-rclone/05-s24ultra032/config.conf`).toString("base64")}`);
    contentFile.push(`RCLONE_CONF_BASE64_06_ip13pm032 = ${fs.readFileSync(`F:/o-photo-rclone/06-ip13pm032/config.conf`).toString("base64")}`);
    fs.writeFileSync(v.tempPathBase64, contentFile.join("\n"));
    execSync(`gh secret set RCLONE_CONF_BASE64 --env-file RCLONE_CONF_BASE64.tmp.gitignorefile --repo ongtrieuhau-dh/rclone-cloud-manager `);
    execSync(`gh auth logout`);
  } catch (error) {
    console.error(`ERR:::${error.message}`);
  } finally {
    rNode._LOG(v);
    try {
      // fs.rmSync(v.tempPathBase64);
    } catch {}
  }
})();
