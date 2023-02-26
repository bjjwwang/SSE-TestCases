; ModuleID = 'mac_bc/overflow_pass/BUF_OVERFLOW_String_Overflow_Strcpy_Size_Const_BadCase02-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_String_Overflow_Strcpy_Size_Const_BadCase02-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @TestCaseBad02(i8* noundef %source_buffer) #0 !dbg !9 {
entry:
  %source_buffer.addr = alloca i8*, align 8
  %destination_buffer = alloca [10 x i8], align 1
  store i8* %source_buffer, i8** %source_buffer.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %source_buffer.addr, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata [10 x i8]* %destination_buffer, metadata !18, metadata !DIExpression()), !dbg !22
  %0 = bitcast [10 x i8]* %destination_buffer to i8*, !dbg !22
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 10, i1 false), !dbg !22
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %destination_buffer, i64 0, i64 0, !dbg !23
  call void @llvm.memset.p0i8.i64(i8* align 1 %arraydecay, i8 49, i64 9, i1 false), !dbg !23
  %arrayidx = getelementptr inbounds [10 x i8], [10 x i8]* %destination_buffer, i64 0, i64 9, !dbg !24
  store i8 0, i8* %arrayidx, align 1, !dbg !25
  %arraydecay1 = getelementptr inbounds [10 x i8], [10 x i8]* %destination_buffer, i64 0, i64 0, !dbg !26
  %1 = load i8*, i8** %source_buffer.addr, align 8, !dbg !26
  %call = call i8* @__strcpy_chk(i8* noundef %arraydecay1, i8* noundef %1, i64 noundef 10) #4, !dbg !26
  ret void, !dbg !27
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__strcpy_chk(i8* noundef, i8* noundef, i64 noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !28 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %source_buffer = alloca [20 x i8], align 16
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !33, metadata !DIExpression()), !dbg !34
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !35, metadata !DIExpression()), !dbg !36
  %0 = load i32, i32* %argc.addr, align 4, !dbg !37
  %cmp = icmp slt i32 %0, 2, !dbg !39
  br i1 %cmp, label %if.then, label %if.end, !dbg !40

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !41
  br label %return, !dbg !41

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [20 x i8]* %source_buffer, metadata !43, metadata !DIExpression()), !dbg !47
  %1 = bitcast [20 x i8]* %source_buffer to i8*, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 20, i1 false), !dbg !47
  %arraydecay = getelementptr inbounds [20 x i8], [20 x i8]* %source_buffer, i64 0, i64 0, !dbg !48
  call void @TestCaseBad02(i8* noundef %arraydecay), !dbg !49
  store i32 0, i32* %retval, align 4, !dbg !50
  br label %return, !dbg !50

return:                                           ; preds = %if.end, %if.then
  %2 = load i32, i32* %retval, align 4, !dbg !51
  ret i32 %2, !dbg !51
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_String_Overflow_Strcpy_Size_Const_BadCase02-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "TestCaseBad02", scope: !10, file: !10, line: 22, type: !11, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_String_Overflow_Strcpy_Size_Const_BadCase02-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!15 = !{}
!16 = !DILocalVariable(name: "source_buffer", arg: 1, scope: !9, file: !10, line: 22, type: !13)
!17 = !DILocation(line: 22, column: 26, scope: !9)
!18 = !DILocalVariable(name: "destination_buffer", scope: !9, file: !10, line: 24, type: !19)
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 80, elements: !20)
!20 = !{!21}
!21 = !DISubrange(count: 10)
!22 = !DILocation(line: 24, column: 10, scope: !9)
!23 = !DILocation(line: 26, column: 5, scope: !9)
!24 = !DILocation(line: 27, column: 5, scope: !9)
!25 = !DILocation(line: 27, column: 27, scope: !9)
!26 = !DILocation(line: 30, column: 5, scope: !9)
!27 = !DILocation(line: 31, column: 1, scope: !9)
!28 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 33, type: !29, scopeLine: 34, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!29 = !DISubroutineType(types: !30)
!30 = !{!31, !31, !32}
!31 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!33 = !DILocalVariable(name: "argc", arg: 1, scope: !28, file: !10, line: 33, type: !31)
!34 = !DILocation(line: 33, column: 14, scope: !28)
!35 = !DILocalVariable(name: "argv", arg: 2, scope: !28, file: !10, line: 33, type: !32)
!36 = !DILocation(line: 33, column: 26, scope: !28)
!37 = !DILocation(line: 35, column: 9, scope: !38)
!38 = distinct !DILexicalBlock(scope: !28, file: !10, line: 35, column: 9)
!39 = !DILocation(line: 35, column: 14, scope: !38)
!40 = !DILocation(line: 35, column: 9, scope: !28)
!41 = !DILocation(line: 36, column: 9, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !10, line: 35, column: 19)
!43 = !DILocalVariable(name: "source_buffer", scope: !28, file: !10, line: 39, type: !44)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 160, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 20)
!47 = !DILocation(line: 39, column: 10, scope: !28)
!48 = !DILocation(line: 40, column: 19, scope: !28)
!49 = !DILocation(line: 40, column: 5, scope: !28)
!50 = !DILocation(line: 41, column: 5, scope: !28)
!51 = !DILocation(line: 42, column: 1, scope: !28)
