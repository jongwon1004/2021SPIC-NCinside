package com.ecc.ncinside.domain;

import java.util.Objects;

public class Type {
    private Integer typeNo;
    private String typeName;

    public Type() {}

    public Type(Integer typeNo, String typeName) {
        this.typeNo = typeNo;
        this.typeName = typeName;
        System.out.println("typeNo = " + typeNo);
    }

    public Integer getTypeNo() {
        return typeNo;
    }

    public void setTypeNo(Integer typeNo) {
        this.typeNo = typeNo;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Type type = (Type) o;
        return typeNo == type.typeNo && Objects.equals(typeName, type.typeName);
    }

    @Override
    public int hashCode() {
        return Objects.hash(typeNo, typeName);
    }

    @Override
    public String toString() {
        return "Type{" +
                "typeNo=" + getTypeNo() +
                ", typeName='" + getTypeName() + '\'' +
                '}';
    }
}
