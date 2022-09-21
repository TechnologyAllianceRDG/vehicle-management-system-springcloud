package com.dra.pojo.login;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * @author liuwang
 * @create 2021-08-13 14:43:34 
 * @description  
 */

@Data
@NoArgsConstructor
@AllArgsConstructor
public class File implements Serializable {

	private String fileId;

	private String fileName;

	private String fileUrl;

}
