; ModuleID = '/Users/jiaweiwang/CLionProjects/0419Case/testcase_bc/safe/InFunc_MemsPackaged_DestOverflow_BadCase08.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0419Case/safe/InFunc_MemsPackaged_DestOverflow_BadCase08.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @cwe120_c_118(i8* noundef %buf, i64 noundef %bufSize, i8* noundef %msg) #0 !dbg !9 {
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
  %call1 = call i32 @XXX_memcpy_sp(i8* noundef %1, i64 noundef %2, i8* noundef %3, i64 noundef %4), !dbg !35
  ret void, !dbg !36
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i64 @strlen(i8* noundef) #2

declare i32 @XXX_memcpy_sp(i8* noundef, i64 noundef, i8* noundef, i64 noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !37 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %buf = alloca [16 x i8], align 16
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !42, metadata !DIExpression()), !dbg !43
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !44, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata [16 x i8]* %buf, metadata !46, metadata !DIExpression()), !dbg !50
  %0 = load i32, i32* %argc.addr, align 4, !dbg !51
  %cmp = icmp sgt i32 %0, 1, !dbg !53
  br i1 %cmp, label %if.then, label %if.end, !dbg !54

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %buf, i64 0, i64 0, !dbg !55
  %1 = load i8**, i8*** %argv.addr, align 8, !dbg !57
  %arrayidx = getelementptr inbounds i8*, i8** %1, i64 1, !dbg !57
  %2 = load i8*, i8** %arrayidx, align 8, !dbg !57
  call void @cwe120_c_118(i8* noundef %arraydecay, i64 noundef 16, i8* noundef %2), !dbg !58
  br label %if.end, !dbg !59

if.end:                                           ; preds = %if.then, %entry
  ret i32 0, !dbg !60
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0419Case/safe/InFunc_MemsPackaged_DestOverflow_BadCase08.c", directory: "/Users/jiaweiwang/CLionProjects/0419Case")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "cwe120_c_118", scope: !10, file: !10, line: 16, type: !11, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !20)
!10 = !DIFile(filename: "safe/InFunc_MemsPackaged_DestOverflow_BadCase08.c", directory: "/Users/jiaweiwang/CLionProjects/0419Case")
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
!21 = !DILocalVariable(name: "buf", arg: 1, scope: !9, file: !10, line: 16, type: !13)
!22 = !DILocation(line: 16, column: 25, scope: !9)
!23 = !DILocalVariable(name: "bufSize", arg: 2, scope: !9, file: !10, line: 16, type: !15)
!24 = !DILocation(line: 16, column: 37, scope: !9)
!25 = !DILocalVariable(name: "msg", arg: 3, scope: !9, file: !10, line: 16, type: !13)
!26 = !DILocation(line: 16, column: 52, scope: !9)
!27 = !DILocalVariable(name: "len", scope: !9, file: !10, line: 18, type: !15)
!28 = !DILocation(line: 18, column: 12, scope: !9)
!29 = !DILocation(line: 18, column: 25, scope: !9)
!30 = !DILocation(line: 18, column: 18, scope: !9)
!31 = !DILocation(line: 20, column: 19, scope: !9)
!32 = !DILocation(line: 20, column: 24, scope: !9)
!33 = !DILocation(line: 20, column: 29, scope: !9)
!34 = !DILocation(line: 20, column: 34, scope: !9)
!35 = !DILocation(line: 20, column: 5, scope: !9)
!36 = !DILocation(line: 21, column: 1, scope: !9)
!37 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 22, type: !38, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !20)
!38 = !DISubroutineType(types: !39)
!39 = !{!40, !40, !41}
!40 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!41 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!42 = !DILocalVariable(name: "argc", arg: 1, scope: !37, file: !10, line: 22, type: !40)
!43 = !DILocation(line: 22, column: 14, scope: !37)
!44 = !DILocalVariable(name: "argv", arg: 2, scope: !37, file: !10, line: 22, type: !41)
!45 = !DILocation(line: 22, column: 27, scope: !37)
!46 = !DILocalVariable(name: "buf", scope: !37, file: !10, line: 24, type: !47)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 128, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 16)
!50 = !DILocation(line: 24, column: 10, scope: !37)
!51 = !DILocation(line: 25, column: 9, scope: !52)
!52 = distinct !DILexicalBlock(scope: !37, file: !10, line: 25, column: 9)
!53 = !DILocation(line: 25, column: 14, scope: !52)
!54 = !DILocation(line: 25, column: 9, scope: !37)
!55 = !DILocation(line: 26, column: 22, scope: !56)
!56 = distinct !DILexicalBlock(scope: !52, file: !10, line: 25, column: 19)
!57 = !DILocation(line: 26, column: 40, scope: !56)
!58 = !DILocation(line: 26, column: 9, scope: !56)
!59 = !DILocation(line: 27, column: 5, scope: !56)
!60 = !DILocation(line: 28, column: 5, scope: !37)
