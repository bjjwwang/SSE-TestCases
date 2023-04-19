; ModuleID = '/Users/jiaweiwang/CLionProjects/0419Case/testcase_bc/general/SelfdefinedMemset_CountOverflow_BadCase03.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0419Case/general/SelfdefinedMemset_CountOverflow_BadCase03.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i8* @cwe120_c_53(i8* noundef %s, i32 noundef %c, i32* noundef %n) #0 !dbg !14 {
entry:
  %s.addr = alloca i8*, align 8
  %c.addr = alloca i32, align 4
  %n.addr = alloca i32*, align 8
  %uc = alloca i8, align 1
  %su = alloca i8*, align 8
  store i8* %s, i8** %s.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %s.addr, metadata !20, metadata !DIExpression()), !dbg !21
  store i32 %c, i32* %c.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %c.addr, metadata !22, metadata !DIExpression()), !dbg !23
  store i32* %n, i32** %n.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %n.addr, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i8* %uc, metadata !26, metadata !DIExpression()), !dbg !28
  %0 = load i32, i32* %c.addr, align 4, !dbg !29
  %conv = trunc i32 %0 to i8, !dbg !29
  store i8 %conv, i8* %uc, align 1, !dbg !28
  call void @llvm.dbg.declare(metadata i8** %su, metadata !30, metadata !DIExpression()), !dbg !31
  %1 = load i8*, i8** %s.addr, align 8, !dbg !32
  store i8* %1, i8** %su, align 8, !dbg !34
  br label %for.cond, !dbg !35

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32*, i32** %n.addr, align 8, !dbg !36
  %cmp = icmp ult i32* null, %2, !dbg !38
  br i1 %cmp, label %for.body, label %for.end, !dbg !39

for.body:                                         ; preds = %for.cond
  %3 = load i8, i8* %uc, align 1, !dbg !40
  %4 = load i8*, i8** %su, align 8, !dbg !42
  store i8 %3, i8* %4, align 1, !dbg !43
  br label %for.inc, !dbg !44

for.inc:                                          ; preds = %for.body
  %5 = load i8*, i8** %su, align 8, !dbg !45
  %incdec.ptr = getelementptr inbounds i8, i8* %5, i32 1, !dbg !45
  store i8* %incdec.ptr, i8** %su, align 8, !dbg !45
  %6 = load i32*, i32** %n.addr, align 8, !dbg !46
  %incdec.ptr2 = getelementptr inbounds i32, i32* %6, i32 -1, !dbg !46
  store i32* %incdec.ptr2, i32** %n.addr, align 8, !dbg !46
  br label %for.cond, !dbg !47, !llvm.loop !48

for.end:                                          ; preds = %for.cond
  %7 = load i8*, i8** %s.addr, align 8, !dbg !51
  ret i8* %7, !dbg !52
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !53 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %dest = alloca [5 x i8], align 1
  %n = alloca i32*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !59, metadata !DIExpression()), !dbg !60
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !61, metadata !DIExpression()), !dbg !62
  %0 = load i32, i32* %argc.addr, align 4, !dbg !63
  %cmp = icmp slt i32 %0, 2, !dbg !65
  br i1 %cmp, label %if.then, label %if.end, !dbg !66

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !67
  br label %return, !dbg !67

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [5 x i8]* %dest, metadata !69, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata i32** %n, metadata !74, metadata !DIExpression()), !dbg !75
  %1 = load i8**, i8*** %argv.addr, align 8, !dbg !76
  %arrayidx = getelementptr inbounds i8*, i8** %1, i64 1, !dbg !76
  %2 = load i8*, i8** %arrayidx, align 8, !dbg !76
  %3 = bitcast i8* %2 to i32*, !dbg !77
  store i32* %3, i32** %n, align 8, !dbg !75
  %4 = load i32*, i32** %n, align 8, !dbg !78
  %call = call i32 (i8*, ...) @scanf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* noundef %4), !dbg !79
  %arraydecay = getelementptr inbounds [5 x i8], [5 x i8]* %dest, i64 0, i64 0, !dbg !80
  %5 = load i32*, i32** %n, align 8, !dbg !81
  %call1 = call i8* @cwe120_c_53(i8* noundef %arraydecay, i32 noundef 0, i32* noundef %5), !dbg !82
  store i32 0, i32* %retval, align 4, !dbg !83
  br label %return, !dbg !83

return:                                           ; preds = %if.end, %if.then
  %6 = load i32, i32* %retval, align 4, !dbg !84
  ret i32 %6, !dbg !84
}

declare i32 @scanf(i8* noundef, ...) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0419Case/general/SelfdefinedMemset_CountOverflow_BadCase03.c", directory: "/Users/jiaweiwang/CLionProjects/0419Case")
!2 = !{!3, !5}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"PIC Level", i32 2}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"Homebrew clang version 14.0.6"}
!14 = distinct !DISubprogram(name: "cwe120_c_53", scope: !15, file: !15, line: 13, type: !16, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!15 = !DIFile(filename: "general/SelfdefinedMemset_CountOverflow_BadCase03.c", directory: "/Users/jiaweiwang/CLionProjects/0419Case")
!16 = !DISubroutineType(types: !17)
!17 = !{!18, !18, !6, !5}
!18 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!19 = !{}
!20 = !DILocalVariable(name: "s", arg: 1, scope: !14, file: !15, line: 13, type: !18)
!21 = !DILocation(line: 13, column: 27, scope: !14)
!22 = !DILocalVariable(name: "c", arg: 2, scope: !14, file: !15, line: 13, type: !6)
!23 = !DILocation(line: 13, column: 34, scope: !14)
!24 = !DILocalVariable(name: "n", arg: 3, scope: !14, file: !15, line: 13, type: !5)
!25 = !DILocation(line: 13, column: 43, scope: !14)
!26 = !DILocalVariable(name: "uc", scope: !14, file: !15, line: 15, type: !27)
!27 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4)
!28 = !DILocation(line: 15, column: 25, scope: !14)
!29 = !DILocation(line: 15, column: 30, scope: !14)
!30 = !DILocalVariable(name: "su", scope: !14, file: !15, line: 16, type: !3)
!31 = !DILocation(line: 16, column: 20, scope: !14)
!32 = !DILocation(line: 18, column: 32, scope: !33)
!33 = distinct !DILexicalBlock(scope: !14, file: !15, line: 18, column: 5)
!34 = !DILocation(line: 18, column: 13, scope: !33)
!35 = !DILocation(line: 18, column: 10, scope: !33)
!36 = !DILocation(line: 18, column: 39, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !15, line: 18, column: 5)
!38 = !DILocation(line: 18, column: 37, scope: !37)
!39 = !DILocation(line: 18, column: 5, scope: !33)
!40 = !DILocation(line: 19, column: 15, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !15, line: 18, column: 53)
!42 = !DILocation(line: 19, column: 10, scope: !41)
!43 = !DILocation(line: 19, column: 13, scope: !41)
!44 = !DILocation(line: 20, column: 5, scope: !41)
!45 = !DILocation(line: 18, column: 42, scope: !37)
!46 = !DILocation(line: 18, column: 48, scope: !37)
!47 = !DILocation(line: 18, column: 5, scope: !37)
!48 = distinct !{!48, !39, !49, !50}
!49 = !DILocation(line: 20, column: 5, scope: !33)
!50 = !{!"llvm.loop.mustprogress"}
!51 = !DILocation(line: 22, column: 12, scope: !14)
!52 = !DILocation(line: 22, column: 5, scope: !14)
!53 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 24, type: !54, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!54 = !DISubroutineType(types: !55)
!55 = !{!6, !6, !56}
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !15, line: 24, type: !6)
!60 = !DILocation(line: 24, column: 14, scope: !53)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !15, line: 24, type: !56)
!62 = !DILocation(line: 24, column: 26, scope: !53)
!63 = !DILocation(line: 26, column: 9, scope: !64)
!64 = distinct !DILexicalBlock(scope: !53, file: !15, line: 26, column: 9)
!65 = !DILocation(line: 26, column: 14, scope: !64)
!66 = !DILocation(line: 26, column: 9, scope: !53)
!67 = !DILocation(line: 27, column: 9, scope: !68)
!68 = distinct !DILexicalBlock(scope: !64, file: !15, line: 26, column: 19)
!69 = !DILocalVariable(name: "dest", scope: !53, file: !15, line: 30, type: !70)
!70 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 40, elements: !71)
!71 = !{!72}
!72 = !DISubrange(count: 5)
!73 = !DILocation(line: 30, column: 19, scope: !53)
!74 = !DILocalVariable(name: "n", scope: !53, file: !15, line: 31, type: !5)
!75 = !DILocation(line: 31, column: 11, scope: !53)
!76 = !DILocation(line: 31, column: 22, scope: !53)
!77 = !DILocation(line: 31, column: 15, scope: !53)
!78 = !DILocation(line: 32, column: 17, scope: !53)
!79 = !DILocation(line: 32, column: 5, scope: !53)
!80 = !DILocation(line: 33, column: 17, scope: !53)
!81 = !DILocation(line: 33, column: 26, scope: !53)
!82 = !DILocation(line: 33, column: 5, scope: !53)
!83 = !DILocation(line: 34, column: 5, scope: !53)
!84 = !DILocation(line: 35, column: 1, scope: !53)
