; ModuleID = '/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/testcase_bc/safe/InFunc_MemsetsPackaged_DestOverflow_BadCase01-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/safe/InFunc_MemsetsPackaged_DestOverflow_BadCase01-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @cwe120_c_144(i8* noundef %buf, i64 noundef %bufSize, i8* noundef %msg) #0 !dbg !9 {
entry:
  %buf.addr = alloca i8*, align 8
  %bufSize.addr = alloca i64, align 8
  %msg.addr = alloca i8*, align 8
  %len = alloca i64, align 8
  store i8* %buf, i8** %buf.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %buf.addr, metadata !21, metadata !DIExpression()), !dbg !22
  store i64 %bufSize, i64* %bufSize.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %bufSize.addr, metadata !23, metadata !DIExpression()), !dbg !24
  store i8* %msg, i8** %msg.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %msg.addr, metadata !25, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata i64* %len, metadata !27, metadata !DIExpression()), !dbg !28
  %0 = load i8*, i8** %msg.addr, align 8, !dbg !29
  %call = call i64 @strlen(i8* noundef %0), !dbg !30
  store i64 %call, i64* %len, align 8, !dbg !28
  %1 = load i8*, i8** %buf.addr, align 8, !dbg !31
  %2 = load i64, i64* %len, align 8, !dbg !32
  %3 = load i8*, i8** %msg.addr, align 8, !dbg !33
  %4 = load i64, i64* %len, align 8, !dbg !34
  %call1 = call i32 @XXX_memset_Safe(i8* noundef %1, i64 noundef %2, i8* noundef %3, i64 noundef %4), !dbg !35
  ret void, !dbg !36
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i64 @strlen(i8* noundef) #2

declare i32 @XXX_memset_Safe(i8* noundef, i64 noundef, i8* noundef, i64 noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @SRC_memset_s(i8* noundef %dest, i64 noundef %destMax, i32 noundef %c, i64 noundef %count) #0 !dbg !37 {
entry:
  %dest.addr = alloca i8*, align 8
  %destMax.addr = alloca i64, align 8
  %c.addr = alloca i32, align 4
  %count.addr = alloca i64, align 8
  store i8* %dest, i8** %dest.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dest.addr, metadata !42, metadata !DIExpression()), !dbg !43
  store i64 %destMax, i64* %destMax.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %destMax.addr, metadata !44, metadata !DIExpression()), !dbg !45
  store i32 %c, i32* %c.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %c.addr, metadata !46, metadata !DIExpression()), !dbg !47
  store i64 %count, i64* %count.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %count.addr, metadata !48, metadata !DIExpression()), !dbg !49
  %0 = load i8*, i8** %dest.addr, align 8, !dbg !50
  %1 = load i64, i64* %destMax.addr, align 8, !dbg !51
  %2 = load i32, i32* %c.addr, align 4, !dbg !52
  %3 = load i64, i64* %count.addr, align 8, !dbg !53
  %call = call i32 @memset_s(i8* noundef %0, i64 noundef %1, i32 noundef %2, i64 noundef %3), !dbg !54
  ret i32 %call, !dbg !55
}

declare i32 @memset_s(i8* noundef, i64 noundef, i32 noundef, i64 noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @cwe120_c_139(i8* noundef %buf, i64 noundef %bufSize, i8* noundef %msg) #0 !dbg !56 {
entry:
  %buf.addr = alloca i8*, align 8
  %bufSize.addr = alloca i64, align 8
  %msg.addr = alloca i8*, align 8
  %len = alloca i64, align 8
  store i8* %buf, i8** %buf.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %buf.addr, metadata !57, metadata !DIExpression()), !dbg !58
  store i64 %bufSize, i64* %bufSize.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %bufSize.addr, metadata !59, metadata !DIExpression()), !dbg !60
  store i8* %msg, i8** %msg.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %msg.addr, metadata !61, metadata !DIExpression()), !dbg !62
  call void @llvm.dbg.declare(metadata i64* %len, metadata !63, metadata !DIExpression()), !dbg !64
  %0 = load i8*, i8** %msg.addr, align 8, !dbg !65
  %call = call i64 @strlen(i8* noundef %0), !dbg !66
  store i64 %call, i64* %len, align 8, !dbg !64
  %1 = load i8*, i8** %buf.addr, align 8, !dbg !67
  %2 = load i64, i64* %len, align 8, !dbg !68
  %3 = load i64, i64* %len, align 8, !dbg !69
  %call1 = call i32 @SRC_memset_s(i8* noundef %1, i64 noundef %2, i32 noundef 0, i64 noundef %3), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !72 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %buf = alloca [16 x i8], align 16
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !76, metadata !DIExpression()), !dbg !77
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata [16 x i8]* %buf, metadata !80, metadata !DIExpression()), !dbg !84
  %0 = load i32, i32* %argc.addr, align 4, !dbg !85
  %cmp = icmp sgt i32 %0, 1, !dbg !87
  br i1 %cmp, label %if.then, label %if.end, !dbg !88

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %buf, i64 0, i64 0, !dbg !89
  %1 = load i8**, i8*** %argv.addr, align 8, !dbg !91
  %arrayidx = getelementptr inbounds i8*, i8** %1, i64 1, !dbg !91
  %2 = load i8*, i8** %arrayidx, align 8, !dbg !91
  call void @cwe120_c_139(i8* noundef %arraydecay, i64 noundef 16, i8* noundef %2), !dbg !92
  %arraydecay1 = getelementptr inbounds [16 x i8], [16 x i8]* %buf, i64 0, i64 0, !dbg !93
  %3 = load i8**, i8*** %argv.addr, align 8, !dbg !94
  %arrayidx2 = getelementptr inbounds i8*, i8** %3, i64 1, !dbg !94
  %4 = load i8*, i8** %arrayidx2, align 8, !dbg !94
  call void @cwe120_c_144(i8* noundef %arraydecay1, i64 noundef 16, i8* noundef %4), !dbg !95
  br label %if.end, !dbg !96

if.end:                                           ; preds = %if.then, %entry
  ret i32 0, !dbg !97
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/safe/InFunc_MemsetsPackaged_DestOverflow_BadCase01-1.c", directory: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "cwe120_c_144", scope: !10, file: !10, line: 14, type: !11, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !20)
!10 = !DIFile(filename: "safe/InFunc_MemsetsPackaged_DestOverflow_BadCase01-1.c", directory: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13, !15, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !16, line: 31, baseType: !17)
!16 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !18, line: 94, baseType: !19)
!18 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!19 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!20 = !{}
!21 = !DILocalVariable(name: "buf", arg: 1, scope: !9, file: !10, line: 14, type: !13)
!22 = !DILocation(line: 14, column: 25, scope: !9)
!23 = !DILocalVariable(name: "bufSize", arg: 2, scope: !9, file: !10, line: 14, type: !15)
!24 = !DILocation(line: 14, column: 37, scope: !9)
!25 = !DILocalVariable(name: "msg", arg: 3, scope: !9, file: !10, line: 14, type: !13)
!26 = !DILocation(line: 14, column: 52, scope: !9)
!27 = !DILocalVariable(name: "len", scope: !9, file: !10, line: 16, type: !15)
!28 = !DILocation(line: 16, column: 12, scope: !9)
!29 = !DILocation(line: 16, column: 25, scope: !9)
!30 = !DILocation(line: 16, column: 18, scope: !9)
!31 = !DILocation(line: 18, column: 21, scope: !9)
!32 = !DILocation(line: 18, column: 26, scope: !9)
!33 = !DILocation(line: 18, column: 31, scope: !9)
!34 = !DILocation(line: 18, column: 36, scope: !9)
!35 = !DILocation(line: 18, column: 5, scope: !9)
!36 = !DILocation(line: 19, column: 1, scope: !9)
!37 = distinct !DISubprogram(name: "SRC_memset_s", scope: !10, file: !10, line: 21, type: !38, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !20)
!38 = !DISubroutineType(types: !39)
!39 = !{!40, !41, !15, !40, !15}
!40 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!41 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!42 = !DILocalVariable(name: "dest", arg: 1, scope: !37, file: !10, line: 21, type: !41)
!43 = !DILocation(line: 21, column: 24, scope: !37)
!44 = !DILocalVariable(name: "destMax", arg: 2, scope: !37, file: !10, line: 21, type: !15)
!45 = !DILocation(line: 21, column: 37, scope: !37)
!46 = !DILocalVariable(name: "c", arg: 3, scope: !37, file: !10, line: 21, type: !40)
!47 = !DILocation(line: 21, column: 50, scope: !37)
!48 = !DILocalVariable(name: "count", arg: 4, scope: !37, file: !10, line: 21, type: !15)
!49 = !DILocation(line: 21, column: 60, scope: !37)
!50 = !DILocation(line: 23, column: 21, scope: !37)
!51 = !DILocation(line: 23, column: 27, scope: !37)
!52 = !DILocation(line: 23, column: 36, scope: !37)
!53 = !DILocation(line: 23, column: 39, scope: !37)
!54 = !DILocation(line: 23, column: 12, scope: !37)
!55 = !DILocation(line: 23, column: 5, scope: !37)
!56 = distinct !DISubprogram(name: "cwe120_c_139", scope: !10, file: !10, line: 29, type: !11, scopeLine: 30, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !20)
!57 = !DILocalVariable(name: "buf", arg: 1, scope: !56, file: !10, line: 29, type: !13)
!58 = !DILocation(line: 29, column: 25, scope: !56)
!59 = !DILocalVariable(name: "bufSize", arg: 2, scope: !56, file: !10, line: 29, type: !15)
!60 = !DILocation(line: 29, column: 37, scope: !56)
!61 = !DILocalVariable(name: "msg", arg: 3, scope: !56, file: !10, line: 29, type: !13)
!62 = !DILocation(line: 29, column: 52, scope: !56)
!63 = !DILocalVariable(name: "len", scope: !56, file: !10, line: 31, type: !15)
!64 = !DILocation(line: 31, column: 12, scope: !56)
!65 = !DILocation(line: 31, column: 25, scope: !56)
!66 = !DILocation(line: 31, column: 18, scope: !56)
!67 = !DILocation(line: 33, column: 18, scope: !56)
!68 = !DILocation(line: 33, column: 23, scope: !56)
!69 = !DILocation(line: 33, column: 31, scope: !56)
!70 = !DILocation(line: 33, column: 5, scope: !56)
!71 = !DILocation(line: 34, column: 1, scope: !56)
!72 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 35, type: !73, scopeLine: 36, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !20)
!73 = !DISubroutineType(types: !74)
!74 = !{!40, !40, !75}
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!76 = !DILocalVariable(name: "argc", arg: 1, scope: !72, file: !10, line: 35, type: !40)
!77 = !DILocation(line: 35, column: 14, scope: !72)
!78 = !DILocalVariable(name: "argv", arg: 2, scope: !72, file: !10, line: 35, type: !75)
!79 = !DILocation(line: 35, column: 27, scope: !72)
!80 = !DILocalVariable(name: "buf", scope: !72, file: !10, line: 37, type: !81)
!81 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 128, elements: !82)
!82 = !{!83}
!83 = !DISubrange(count: 16)
!84 = !DILocation(line: 37, column: 10, scope: !72)
!85 = !DILocation(line: 38, column: 9, scope: !86)
!86 = distinct !DILexicalBlock(scope: !72, file: !10, line: 38, column: 9)
!87 = !DILocation(line: 38, column: 14, scope: !86)
!88 = !DILocation(line: 38, column: 9, scope: !72)
!89 = !DILocation(line: 39, column: 22, scope: !90)
!90 = distinct !DILexicalBlock(scope: !86, file: !10, line: 38, column: 19)
!91 = !DILocation(line: 39, column: 40, scope: !90)
!92 = !DILocation(line: 39, column: 9, scope: !90)
!93 = !DILocation(line: 40, column: 22, scope: !90)
!94 = !DILocation(line: 40, column: 40, scope: !90)
!95 = !DILocation(line: 40, column: 9, scope: !90)
!96 = !DILocation(line: 41, column: 5, scope: !90)
!97 = !DILocation(line: 42, column: 5, scope: !72)
