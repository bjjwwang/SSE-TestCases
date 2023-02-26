; ModuleID = 'linux_bc/overflow_pass/BUF_OVERFLOW_String_Overflow_Strcpy_Size_Const_BadCase02-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_String_Overflow_Strcpy_Size_Const_BadCase02-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @TestCaseBad02(i8* %source_buffer) #0 !dbg !9 {
entry:
  %source_buffer.addr = alloca i8*, align 8
  %destination_buffer = alloca [10 x i8], align 1
  store i8* %source_buffer, i8** %source_buffer.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %source_buffer.addr, metadata !15, metadata !DIExpression()), !dbg !16
  call void @llvm.dbg.declare(metadata [10 x i8]* %destination_buffer, metadata !17, metadata !DIExpression()), !dbg !21
  %0 = bitcast [10 x i8]* %destination_buffer to i8*, !dbg !21
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 10, i1 false), !dbg !21
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %destination_buffer, i64 0, i64 0, !dbg !22
  call void @llvm.memset.p0i8.i64(i8* align 1 %arraydecay, i8 49, i64 9, i1 false), !dbg !22
  %arrayidx = getelementptr inbounds [10 x i8], [10 x i8]* %destination_buffer, i64 0, i64 9, !dbg !23
  store i8 0, i8* %arrayidx, align 1, !dbg !24
  %arraydecay1 = getelementptr inbounds [10 x i8], [10 x i8]* %destination_buffer, i64 0, i64 0, !dbg !25
  %1 = load i8*, i8** %source_buffer.addr, align 8, !dbg !26
  %call = call i8* @strcpy(i8* %arraydecay1, i8* %1) #4, !dbg !27
  ret void, !dbg !28
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !29 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %source_buffer = alloca [20 x i8], align 16
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !34, metadata !DIExpression()), !dbg !35
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !36, metadata !DIExpression()), !dbg !37
  %0 = load i32, i32* %argc.addr, align 4, !dbg !38
  %cmp = icmp slt i32 %0, 2, !dbg !40
  br i1 %cmp, label %if.then, label %if.end, !dbg !41

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !42
  br label %return, !dbg !42

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [20 x i8]* %source_buffer, metadata !44, metadata !DIExpression()), !dbg !48
  %1 = bitcast [20 x i8]* %source_buffer to i8*, !dbg !48
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 20, i1 false), !dbg !48
  %arraydecay = getelementptr inbounds [20 x i8], [20 x i8]* %source_buffer, i64 0, i64 0, !dbg !49
  call void @TestCaseBad02(i8* %arraydecay), !dbg !50
  store i32 0, i32* %retval, align 4, !dbg !51
  br label %return, !dbg !51

return:                                           ; preds = %if.end, %if.then
  %2 = load i32, i32* %retval, align 4, !dbg !52
  ret i32 %2, !dbg !52
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_String_Overflow_Strcpy_Size_Const_BadCase02-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "TestCaseBad02", scope: !10, file: !10, line: 22, type: !11, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_String_Overflow_Strcpy_Size_Const_BadCase02-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!15 = !DILocalVariable(name: "source_buffer", arg: 1, scope: !9, file: !10, line: 22, type: !13)
!16 = !DILocation(line: 22, column: 26, scope: !9)
!17 = !DILocalVariable(name: "destination_buffer", scope: !9, file: !10, line: 24, type: !18)
!18 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 80, elements: !19)
!19 = !{!20}
!20 = !DISubrange(count: 10)
!21 = !DILocation(line: 24, column: 10, scope: !9)
!22 = !DILocation(line: 26, column: 5, scope: !9)
!23 = !DILocation(line: 27, column: 5, scope: !9)
!24 = !DILocation(line: 27, column: 27, scope: !9)
!25 = !DILocation(line: 30, column: 12, scope: !9)
!26 = !DILocation(line: 30, column: 32, scope: !9)
!27 = !DILocation(line: 30, column: 5, scope: !9)
!28 = !DILocation(line: 31, column: 1, scope: !9)
!29 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 33, type: !30, scopeLine: 34, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!30 = !DISubroutineType(types: !31)
!31 = !{!32, !32, !33}
!32 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!33 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!34 = !DILocalVariable(name: "argc", arg: 1, scope: !29, file: !10, line: 33, type: !32)
!35 = !DILocation(line: 33, column: 14, scope: !29)
!36 = !DILocalVariable(name: "argv", arg: 2, scope: !29, file: !10, line: 33, type: !33)
!37 = !DILocation(line: 33, column: 26, scope: !29)
!38 = !DILocation(line: 35, column: 9, scope: !39)
!39 = distinct !DILexicalBlock(scope: !29, file: !10, line: 35, column: 9)
!40 = !DILocation(line: 35, column: 14, scope: !39)
!41 = !DILocation(line: 35, column: 9, scope: !29)
!42 = !DILocation(line: 36, column: 9, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !10, line: 35, column: 19)
!44 = !DILocalVariable(name: "source_buffer", scope: !29, file: !10, line: 39, type: !45)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 160, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 20)
!48 = !DILocation(line: 39, column: 10, scope: !29)
!49 = !DILocation(line: 40, column: 19, scope: !29)
!50 = !DILocation(line: 40, column: 5, scope: !29)
!51 = !DILocation(line: 41, column: 5, scope: !29)
!52 = !DILocation(line: 42, column: 1, scope: !29)
