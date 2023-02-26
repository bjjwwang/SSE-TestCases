; ModuleID = 'linux_bc/overflow_pass/BUF_OVERFLOW_Buffer_Size_Memcpy_Array_In_Struct_BadCase02-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Buffer_Size_Memcpy_Array_In_Struct_BadCase02-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.MY_SS1 = type { [9 x i8], [11 x i8] }
%struct.MY_SS2 = type { [11 x i8], [9 x i8] }

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %ss1 = alloca %struct.MY_SS1, align 1
  %ss2 = alloca %struct.MY_SS2, align 1
  call void @llvm.dbg.declare(metadata %struct.MY_SS1* %ss1, metadata !14, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata %struct.MY_SS2* %ss2, metadata !27, metadata !DIExpression()), !dbg !32
  %name2 = getelementptr inbounds %struct.MY_SS1, %struct.MY_SS1* %ss1, i32 0, i32 1, !dbg !33
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %name2, i64 0, i64 0, !dbg !34
  %name21 = getelementptr inbounds %struct.MY_SS2, %struct.MY_SS2* %ss2, i32 0, i32 1, !dbg !35
  %arraydecay2 = getelementptr inbounds [9 x i8], [9 x i8]* %name21, i64 0, i64 0, !dbg !34
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %arraydecay, i8* align 1 %arraydecay2, i64 11, i1 false), !dbg !34
  ret i32 0, !dbg !36
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Buffer_Size_Memcpy_Array_In_Struct_BadCase02-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 38, type: !11, scopeLine: 39, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Buffer_Size_Memcpy_Array_In_Struct_BadCase02-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "ss1", scope: !9, file: !10, line: 40, type: !15)
!15 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "MY_SS1", file: !10, line: 24, size: 160, elements: !16)
!16 = !{!17, !22}
!17 = !DIDerivedType(tag: DW_TAG_member, name: "name1", scope: !15, file: !10, line: 25, baseType: !18, size: 72)
!18 = !DICompositeType(tag: DW_TAG_array_type, baseType: !19, size: 72, elements: !20)
!19 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!20 = !{!21}
!21 = !DISubrange(count: 9)
!22 = !DIDerivedType(tag: DW_TAG_member, name: "name2", scope: !15, file: !10, line: 26, baseType: !23, size: 88, offset: 72)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !19, size: 88, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 11)
!26 = !DILocation(line: 40, column: 19, scope: !9)
!27 = !DILocalVariable(name: "ss2", scope: !9, file: !10, line: 41, type: !28)
!28 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "MY_SS2", file: !10, line: 30, size: 160, elements: !29)
!29 = !{!30, !31}
!30 = !DIDerivedType(tag: DW_TAG_member, name: "name1", scope: !28, file: !10, line: 31, baseType: !23, size: 88)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "name2", scope: !28, file: !10, line: 32, baseType: !18, size: 72, offset: 88)
!32 = !DILocation(line: 41, column: 19, scope: !9)
!33 = !DILocation(line: 42, column: 16, scope: !9)
!34 = !DILocation(line: 42, column: 5, scope: !9)
!35 = !DILocation(line: 42, column: 27, scope: !9)
!36 = !DILocation(line: 43, column: 1, scope: !9)
