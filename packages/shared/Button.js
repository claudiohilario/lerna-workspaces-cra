import React from "react";
import styles from "./Button.module.scss";
export const Button = props => (
    <button className={styles.button} onClick={props.onClick} {...props}>
        {props.children}
    </button>
);