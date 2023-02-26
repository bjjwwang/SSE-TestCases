; ModuleID = 'mac_bc/pass/BASIC_ptr_func_4.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/BASIC_ptr_func_4.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %q = alloca i32 (i32*)*, align 8
  %y = alloca i32, align 4
  %r = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !18, metadata !DIExpression()), !dbg !19
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i32 (i32*)** %q, metadata !22, metadata !DIExpression()), !dbg !27
  %call = call i32 @nd_int(), !dbg !28
  %tobool = icmp ne i32 %call, 0, !dbg !28
  br i1 %tobool, label %if.then, label %if.else, !dbg !30

if.then:                                          ; preds = %entry
  store i32 (i32*)* @c, i32 (i32*)** %q, align 8, !dbg !31
  br label %if.end, !dbg !33

if.else:                                          ; preds = %entry
  store i32 (i32*)* @c, i32 (i32*)** %q, align 8, !dbg !34
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i32* %y, metadata !36, metadata !DIExpression()), !dbg !37
  store i32 5, i32* %y, align 4, !dbg !37
  call void @llvm.dbg.declare(metadata i32* %r, metadata !38, metadata !DIExpression()), !dbg !39
  %0 = load i32 (i32*)*, i32 (i32*)** %q, align 8, !dbg !40
  %call1 = call i32 %0(i32* noundef %y), !dbg !40
  store i32 %call1, i32* %r, align 4, !dbg !39
  %1 = load i32, i32* %y, align 4, !dbg !41
  %cmp = icmp sge i32 %1, 7, !dbg !42
  call void @svf_assert(i1 noundef zeroext %cmp), !dbg !43
  %2 = load i32, i32* %retval, align 4, !dbg !44
  ret i32 %2, !dbg !44
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @nd_int() #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @c(i32* noundef %x) #0 !dbg !45 {
entry:
  %x.addr = alloca i32*, align 8
  store i32* %x, i32** %x.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %x.addr, metadata !46, metadata !DIExpression()), !dbg !47
  %0 = load i32*, i32** %x.addr, align 8, !dbg !48
  %1 = load i32, i32* %0, align 4, !dbg !49
  %add = add nsw i32 %1, 5, !dbg !50
  %2 = load i32*, i32** %x.addr, align 8, !dbg !51
  store i32 %add, i32* %2, align 4, !dbg !52
  %call = call i32 @nd_int(), !dbg !53
  %tobool = icmp ne i32 %call, 0, !dbg !53
  %3 = zext i1 %tobool to i64, !dbg !53
  %cond = select i1 %tobool, i32 0, i32 1, !dbg !53
  ret i32 %cond, !dbg !54
}

declare void @svf_assert(i1 noundef zeroext) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/BASIC_ptr_func_4.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!10 = !DIFile(filename: "src/pass/BASIC_ptr_func_4.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13, !14}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!17 = !{}
!18 = !DILocalVariable(name: "argc", arg: 1, scope: !9, file: !10, line: 7, type: !13)
!19 = !DILocation(line: 7, column: 14, scope: !9)
!20 = !DILocalVariable(name: "argv", arg: 2, scope: !9, file: !10, line: 7, type: !14)
!21 = !DILocation(line: 7, column: 27, scope: !9)
!22 = !DILocalVariable(name: "q", scope: !9, file: !10, line: 8, type: !23)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!24 = !DISubroutineType(types: !25)
!25 = !{!13, !26}
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!27 = !DILocation(line: 8, column: 9, scope: !9)
!28 = !DILocation(line: 9, column: 7, scope: !29)
!29 = distinct !DILexicalBlock(scope: !9, file: !10, line: 9, column: 7)
!30 = !DILocation(line: 9, column: 7, scope: !9)
!31 = !DILocation(line: 10, column: 7, scope: !32)
!32 = distinct !DILexicalBlock(scope: !29, file: !10, line: 9, column: 17)
!33 = !DILocation(line: 11, column: 3, scope: !32)
!34 = !DILocation(line: 12, column: 9, scope: !35)
!35 = distinct !DILexicalBlock(scope: !29, file: !10, line: 11, column: 10)
!36 = !DILocalVariable(name: "y", scope: !9, file: !10, line: 14, type: !13)
!37 = !DILocation(line: 14, column: 7, scope: !9)
!38 = !DILocalVariable(name: "r", scope: !9, file: !10, line: 15, type: !13)
!39 = !DILocation(line: 15, column: 7, scope: !9)
!40 = !DILocation(line: 15, column: 11, scope: !9)
!41 = !DILocation(line: 17, column: 14, scope: !9)
!42 = !DILocation(line: 17, column: 16, scope: !9)
!43 = !DILocation(line: 17, column: 3, scope: !9)
!44 = !DILocation(line: 18, column: 1, scope: !9)
!45 = distinct !DISubprogram(name: "c", scope: !10, file: !10, line: 20, type: !24, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!46 = !DILocalVariable(name: "x", arg: 1, scope: !45, file: !10, line: 20, type: !26)
!47 = !DILocation(line: 20, column: 12, scope: !45)
!48 = !DILocation(line: 21, column: 9, scope: !45)
!49 = !DILocation(line: 21, column: 8, scope: !45)
!50 = !DILocation(line: 21, column: 10, scope: !45)
!51 = !DILocation(line: 21, column: 4, scope: !45)
!52 = !DILocation(line: 21, column: 6, scope: !45)
!53 = !DILocation(line: 22, column: 11, scope: !45)
!54 = !DILocation(line: 22, column: 3, scope: !45)
